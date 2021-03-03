class Response<T> {
  Response._();

  factory Response.success(T data) = Success<T>;

  factory Response.error(String message) = Error<T>;
}

class Success<T> extends Response<T> {
  final T value;

  Success(this.value) : super._();
}

class Error<T> extends Response<T> {
  final String message;

  Error(this.message) : super._();
}
