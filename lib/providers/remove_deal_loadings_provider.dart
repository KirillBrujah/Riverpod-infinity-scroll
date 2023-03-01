import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinity_scroll_list/models/models.dart';

part 'remove_deal_loadings_provider.g.dart';

/// Provider-container for storing current removing of deals
@riverpod
class RemoveDealLoadings extends _$RemoveDealLoadings {
  @override
  Set<DealModel> build() {
    return {};
  }

  void removeDeal(DealModel deal) {
    state = Set.of(state)..remove(deal);
  }

  void addDeal(DealModel deal) {
    state = Set.of(state)..add(deal);
  }
}
