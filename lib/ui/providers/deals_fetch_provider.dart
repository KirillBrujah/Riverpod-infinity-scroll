import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinity_scroll_list/ui/models/models.dart';
import 'package:riverpod_infinity_scroll_list/ui/services/network_service.dart';

class AsyncDealsNotifier extends AsyncNotifier<FetchListWrapper<DealModel>> {
  int _page = 0;
  bool _canFetch = true;

  Future<List<DealModel>> _fetch([String? query]) async {
    final deals = await NetworkService().getDeals(
      page: _page,
      query: query,
    );
    _page += 40;
    _canFetch = deals.isNotEmpty;
    return deals;
  }

  Future<void> search(String? query) async {
    _page = 0;
    _canFetch = true;

    // TODO: Debounce
    // TODO: Clear page
    // TODO: _canFetch(true)
    // TODO: Try to fetch
  }

  Future<void> fetch() async {
    if (state.isLoading || !_canFetch) return;
    state = const AsyncLoading();

    try {
      final deals = await _fetch();
      state = AsyncData(FetchListWrapper(data: deals, canFetch: _canFetch));
    } on DioError catch (error, stackTrace) {
      if (error.error.toString().contains("Too Many Results - Refine Search")) {
        _canFetch = false;
        state = AsyncData(FetchListWrapper(data: [], canFetch: _canFetch));
        return;
      }
      state = AsyncError(error, stackTrace);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  @override
  Future<FetchListWrapper<DealModel>> build() async {
    return FetchListWrapper(
      data: await _fetch(),
    );
  }
//
}

final dealsFetchProvider =
    AsyncNotifierProvider<AsyncDealsNotifier, FetchListWrapper<DealModel>>(
  () => AsyncDealsNotifier(),
);
