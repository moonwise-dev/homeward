import '../../errors/app_error.dart';

mixin RepositoryGuard {
  Future<T> guard<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(AppError.fromException(error), stackTrace);
    }
  }

  Stream<T> guardStream<T>(Stream<T> Function() create) => create().handleError(
    (Object error, StackTrace stackTrace) =>
        Error.throwWithStackTrace(AppError.fromException(error), stackTrace),
  );
}
