import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinity_scroll_list/models/deals_models.dart';

import 'all_deals_provider.dart';
import 'remove_deal_loadings_provider.dart';

part 'async_remove_deal_provider.g.dart';

@riverpod
class AsyncRemoveDeal extends _$AsyncRemoveDeal {
  @override
  FutureOr<DealModel?> build() {
    return null;
  }

  Future<void> remove(DealModel deal) async {
    ref.read(removeDealLoadingsProvider.notifier).addDeal(deal);

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        await Future.delayed(const Duration(seconds: 2));
        return deal;
      },
    );

    ref.read(removeDealLoadingsProvider.notifier).removeDeal(deal);
    ref.read(allDealsProvider.notifier).remove(deal);
  }
}
