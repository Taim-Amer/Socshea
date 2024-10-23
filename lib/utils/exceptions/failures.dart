class Failure implements Exception {
  final String code;
  final String message;

  Failure(this.code, this.message);

  @override
  String toString() {
    return message;
  }
}
