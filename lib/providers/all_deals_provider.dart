import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinity_scroll_list/models/models.dart';

import 'deals_fetch_provider.dart';

class AllDealsNotifier extends Notifier<List<DealModel>> {
  @override
  List<DealModel> build() {
    ref.listen(
      dealsFetchProvider.select(
          (AsyncValue<FetchListWrapper> value) => value.asData?.value.data),
      (previous, next) {
        if (next == null) return;
        state = [...state, ...next];
      },
    );
    print("REBUILD ALL DEALS PROVIDER");
    return [];
  }

  void refreshList() {
    state = [];
  }
}

final allDealsProvider = NotifierProvider<AllDealsNotifier, List<DealModel>>(
  () {
    return AllDealsNotifier();
  },
  dependencies: [
    dealsFetchProvider,
  ],
);
