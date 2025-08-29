abstract class Failure implements Exception {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;

  const Failure.noInternet([String message = 'No internet connection']) : this(message);
  const Failure.serverFailure([String message = 'Server failure']) : this(message);
  const Failure.timeoutFailure([String message = 'Response timeout']) : this(message);
}
