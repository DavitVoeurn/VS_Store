class ResponseStatus<T> {
  final Status status;
  final T? data;
  final String? message;

  ResponseStatus._({required this.status, this.data, this.message});

  factory ResponseStatus.initial() {
    return ResponseStatus._(status: Status.initial);
  }

  factory ResponseStatus.success(T data) {
    return ResponseStatus._(status: Status.success, data: data);
  }

  factory ResponseStatus.error(String message) {
    return ResponseStatus._(status: Status.error, message: message);
  }

  factory ResponseStatus.loading() {
    return ResponseStatus._(status: Status.loading);
  }
}

enum Status { initial, success, error, loading }
