import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_models.freezed.dart';

@freezed
class FetchListWrapper<T> with _$FetchListWrapper {
  const factory FetchListWrapper({
    required List<T> data,
    @Default(true) bool canFetch,
  }) = _ListWrapper;
}
