import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinity_scroll_list/ui/providers/providers.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deals")),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: const [
            _SearchField(),
            Expanded(child: _DealsList()),
            _Button(),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: const InputDecoration(
        hintText: "Title...",
        prefixIcon: Icon(Icons.search_rounded),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealsProvider = ref.watch(dealsFetchProvider);

    return dealsProvider.when(
      error: (_, __) => Container(),
      loading: () => const CircularProgressIndicator(),
      data: (data) => data.canFetch
          ? ElevatedButton(
              onPressed: ref.watch(dealsFetchProvider.notifier).fetch,
              child: const Text("Load"),
            )
          : OutlinedButton(
              onPressed: () {},
              child: const Text("Load"),
            ),
    );
  }
}

class _DealsList extends ConsumerWidget {
  const _DealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDeals = ref.watch(allDealsProvider);

    return Center(child: Text('${allDeals.length}'));
  }
}
