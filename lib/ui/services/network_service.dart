import 'package:riverpod_infinity_scroll_list/ui/models/deals_models.dart';
import 'package:riverpod_infinity_scroll_list/ui/utils/dio_client.dart';

class NetworkService {
  final _dio = DioClient();

  Future<List<DealModel>> getDeals({
    int page = 0,
    String? query,
  }) async {
    final response = await _dio.get(
      'deals',
      queryParameters: {
        "pageNumber": page,
        if (query != null && query.isNotEmpty) "title": query,
      },
    );

    return (response.data as List<dynamic>)
        .map((json) => DealModel.fromJson(json))
        .toList();
  }
}
