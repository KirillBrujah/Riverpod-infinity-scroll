import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_infinity_scroll_list/models/deals_models.dart';
import 'package:riverpod_infinity_scroll_list/providers/providers.dart';
import 'package:riverpod_infinity_scroll_list/utils/format_functions.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deals")),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body();

  @override
  ConsumerState<_Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canFetch =
        ref.watch(dealsFetchProvider.select((value) => value.value?.canFetch));

    ref.listen(dealsFetchProvider, (previous, next) {
      next.whenOrNull(
        data: (data) {
          _refreshController.loadComplete();
        },
        error: (error, stackTrace) {
          _refreshController.loadFailed();
        },
      );
    });

    return SmartRefresher(
      controller: _refreshController,
      onLoading: ref.read(dealsFetchProvider.notifier).fetch,
      enablePullDown: false,
      enablePullUp: canFetch == true,
      footer: CustomFooter(
        builder: (context, mode) {
          if (mode == LoadStatus.loading) {
            return const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return Container();
        },
      ),
      child: const CustomScrollView(
        slivers: [
          _SearchField(),
          _EmptyListLoading(),
          _DealsList(),
        ],
      ),
    );
  }
}

class _SearchField extends ConsumerWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: true,
      toolbarHeight: 60,
      elevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: TextField(
          onChanged: ref.read(dealsFetchProvider.notifier).search,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            hoverColor: Colors.white,
            filled: true,
            hintText: "Title...",
            prefixIcon: Icon(Icons.search_rounded),
          ),
        ),
      ),
    );
  }
}

class _EmptyListLoading extends ConsumerWidget {
  const _EmptyListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(dealsFetchProvider.select((value) => value.isLoading));
    final dealsIsEmpty =
        ref.watch(allDealsProvider.select((deals) => deals.isEmpty));

    if (!dealsIsEmpty || !isLoading) return const SliverToBoxAdapter();

    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _DealsList extends ConsumerWidget {
  const _DealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDeals = ref.watch(allDealsProvider);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final deal = allDeals[index];

            return _ListDealCard(deal);
          },
          childCount: allDeals.length,
        ),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 3,
        // ),
      ),
    );
  }
}

class _GridDealCard extends StatelessWidget {
  const _GridDealCard({Key? key, required this.deal}) : super(key: key);

  final DealModel deal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                deal.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${deal.normalPrice}'),
                  const VerticalDivider(),
                  Text('${deal.salePrice}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListDealCard extends StatelessWidget {
  const _ListDealCard(this.deal, {Key? key}) : super(key: key);

  final DealModel deal;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Row(
        children: [
          _ThumbImage(
            path: deal.thumb,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 100,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Text(
                            deal.title,
                            maxLines: 3,
                            style: textTheme.titleMedium,
                          ),
                        ),
                        // TODO: Del button
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          // TODO: Add decoration for discount
                        ),
                        padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                        child: Text(
                          '${deal.discountPercent}%',
                          style: textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        formatCurrency(deal.normalPrice),
                        style: textTheme.titleSmall?.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        formatCurrency(deal.salePrice),
                        style: textTheme.titleLarge,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThumbImage extends StatelessWidget {
  const _ThumbImage({Key? key, this.path}) : super(key: key);

  final String? path;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(5)),
      child: SizedBox(
        height: 100,
        width: 100,
        child: path != null
            ? CachedNetworkImage(
                imageUrl: path!,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Placeholder(),
              )
            : const Placeholder(),
      ),
    );
  }
}
