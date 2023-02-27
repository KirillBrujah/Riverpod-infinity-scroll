import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinity_scroll_list/models/models.dart';
import 'package:riverpod_infinity_scroll_list/providers/all_deals_provider.dart';
import 'package:riverpod_infinity_scroll_list/services/network_service.dart';
import 'package:riverpod_infinity_scroll_list/utils/debounce.dart';

class AsyncDealsNotifier extends AsyncNotifier<FetchListWrapper<DealModel>> {
  int _page = 0;
  bool _canFetch = true;

  Future<List<DealModel>> _fetch([String? query]) async {
    final deals = await NetworkService().getDeals(
      page: _page++,
      query: query,
    );
    _canFetch = deals.isNotEmpty;
    return deals;
  }

  final _debounce = Debounce(const Duration(seconds: 1));

  Future<void> search(String query) async {
    _debounce.run(() async {
      _page = 0;
      _canFetch = true;
      ref.read(allDealsProvider.notifier).refreshList();

      state = const AsyncLoading();

      try {
        final deals = await _fetch(query);
        state = AsyncData(FetchListWrapper(data: deals, canFetch: _canFetch));
      } on DioError catch (error, stackTrace) {
        if (error.error
            .toString()
            .contains("Too Many Results - Refine Search")) {
          _canFetch = false;
          state = AsyncData(FetchListWrapper(data: [], canFetch: _canFetch));
          return;
        }
        state = AsyncError(error, stackTrace);
      } catch (error, stackTrace) {
        state = AsyncError(error, stackTrace);
      }
    });
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
