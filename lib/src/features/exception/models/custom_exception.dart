class CustomException implements Exception {
  final String message;
  final String errorType;
  final String? prefix;
  final String? url;

  const CustomException(
    this.message, {
   required this.errorType ,
    this.prefix,
    this.url,
  });

  @override
  String toString() {
    return '$prefix$message$errorType';
  }
}