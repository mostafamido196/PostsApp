



abstract class Failure {
  String get message;
}

class NetworkFailure implements Failure {
  @override
  final String message;

  NetworkFailure(this.message);
}

class CacheFailure implements Failure {
  @override
  final String message;

  CacheFailure(this.message);
}
class ServerFailure extends Failure {
  @override
  final String message;

  ServerFailure(this.message);
}

class EmptyCacheFailure extends Failure {
  @override
  final String message = "No data found in cache.";
}
