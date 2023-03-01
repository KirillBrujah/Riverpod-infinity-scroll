import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinity_scroll_list/models/models.dart';

part 'all_deals_provider.g.dart';

/// Provider for controlling all loaded deals
@riverpod
class AllDeals extends _$AllDeals {
  @override
  List<DealModel> build() {
    return [];
  }

  void add(Iterable<DealModel> deals) {
    state = [...state, ...deals];
  }

  void remove(DealModel deal) {
    state = List.of(state)..remove(deal);
  }

  void refreshList() {
    state = [];
  }
}
