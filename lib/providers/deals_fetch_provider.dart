import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinity_scroll_list/models/models.dart';
import 'package:riverpod_infinity_scroll_list/services/network_service.dart';
import 'package:riverpod_infinity_scroll_list/utils/debounce.dart';

import 'all_deals_provider.dart';

class AsyncDealsNotifier extends AsyncNotifier<FetchListWrapper<DealModel>> {
  int _page = 0;
  bool _canFetch = true;

  final _debounce = Debounce(const Duration(seconds: 1));

  Future<void> _fetch([String? query]) async {
    state = const AsyncLoading();
    try {
      final deals = await NetworkService().getDeals(
        query: query,
        page: _page,
      );

      ref.read(allDealsProvider.notifier).add(deals);

      _page++;
      _canFetch = deals.isNotEmpty;

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

  Future<void> search(String query) async {
    _debounce.run(() async {
      _page = 0;
      _canFetch = true;
      ref.read(allDealsProvider.notifier).refreshList();

      await _fetch();
    });
  }

  Future<void> fetch() async {
    if (state.isLoading || !_canFetch) return;
    await _fetch();
  }

  @override
  FutureOr<FetchListWrapper<DealModel>> build() async {
    try {
      final deals = await NetworkService().getDeals(
        page: _page,
      );

      ref.read(allDealsProvider.notifier).add(deals);

      _page++;
      _canFetch = deals.isNotEmpty;

      return FetchListWrapper(
        data: deals,
        canFetch: _canFetch,
      );
    } catch (e) {
      log(e.toString(), error: e.toString());
      return const FetchListWrapper(
        data: [],
      );
    }
  }
//
}

final dealsFetchProvider =
    AsyncNotifierProvider<AsyncDealsNotifier, FetchListWrapper<DealModel>>(
  () => AsyncDealsNotifier(),
);
