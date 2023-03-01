import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinity_scroll_list/models/models.dart';

class RemoveDealLoadingsNotifier extends Notifier<Set<DealModel>> {
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

final removeDealLoadingsProvider =
    NotifierProvider<RemoveDealLoadingsNotifier, Set<DealModel>>(
  () => RemoveDealLoadingsNotifier(),
);
