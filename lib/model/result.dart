sealed class Result<T> {
  void fold({
    required Function(T) onSuccess,
    required Function(String? message) onFailure,
  }) =>
      switch (this) {
        FailureResult<T> failureResult => onFailure(failureResult.message),
        SuccessResult<T> successResult => onSuccess(successResult.data),
      };
}

final class FailureResult<T> extends Result<T> {
  final String? message;

  FailureResult([this.message]);
}

final class SuccessResult<T> extends Result<T> {
  final T data;

  SuccessResult(this.data);
}
