class QuestionException implements Exception{
  final String? message;
  final StackTrace? s;

  QuestionException(this.message, [ this.s ]);
}
