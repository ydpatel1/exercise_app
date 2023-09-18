abstract class ApiResult<T> {
  const ApiResult._({this.data, this.error});
  final T? data;
  final dynamic error;

  factory ApiResult.sucsess({required T? data}) = Sucsess<T>;
  factory ApiResult.failure({dynamic error}) = Failure<T>;
}

class Sucsess<T> extends ApiResult<T> {
  Sucsess({required T? data}) : super._(data: data);
}

class Failure<T> extends ApiResult<T> {
  Failure({dynamic error}) : super._(error: error);
}
