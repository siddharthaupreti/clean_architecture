abstract class Failure {
  String failureMessage;

  Failure(this.failureMessage);
}

class LocationFailure extends Failure {
  LocationFailure({String failureMessage: "Location Failure"})
      : super(failureMessage);
}

///server responds but not expected
class ServerFailure extends Failure {
  ServerFailure({String message: "Server Failure"}) : super(message);
}

///Cache responds but not expected
class CacheFailure extends Failure {
  CacheFailure({String failureMessage: "Cache Failure"})
      : super(failureMessage);
}

///NetworkFailure
class NetworkFailure extends Failure {
  NetworkFailure({String failureMessage: "Network Failure"})
      : super(failureMessage);
}

///anything else
class UnknownFailure extends Failure {
  UnknownFailure({String failureMessage: "Unknown Failure"})
      : super(failureMessage);
}

class SocialLoginFailure extends Failure {
  SocialLoginFailure(
      {String failureMessage: "Unable to login with social site"})
      : super(failureMessage);
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({String failureMessage: "Auth failure"})
      : super(failureMessage);
}
