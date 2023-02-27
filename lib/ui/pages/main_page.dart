import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_infinity_scroll_list/models/deals_models.dart';
import 'package:riverpod_infinity_scroll_list/providers/providers.dart';

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
  final _scrollController = ScrollController();
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) ref.read(dealsFetchProvider.notifier).fetch(); //
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onLoading: () {
        print("loading");
      },
      enablePullUp: true,
      child: CustomScrollView(
        // controller: _scrollController,
        slivers: const [
          _SearchField(),
          _DealsList(),
          // _Upload(),
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
      // backgroundColor: Colors.white,
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

class _Upload extends ConsumerWidget {
  const _Upload();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealsProvider = ref.watch(dealsFetchProvider);

    return SliverFillRemaining(
      hasScrollBody: false,
      child: dealsProvider.whenOrNull(
        loading: () => const SizedBox(
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        ),
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
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final deal = allDeals[index];

            return _DealCard(deal: deal);
          },
          childCount: allDeals.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }
}

class _DealCard extends StatelessWidget {
  const _DealCard({Key? key, required this.deal}) : super(key: key);

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
                  Text(deal.normalPrice),
                  const VerticalDivider(),
                  Text(deal.salePrice),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
