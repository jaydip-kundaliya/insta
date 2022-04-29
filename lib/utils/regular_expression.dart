/// contain all type of regular expression within the app
class AppRegex {
  /// It is used to remove last zero
  /// after dot in double number
  ///
  /// like if number is 10.0k then
  /// result will be like
  /// 10.0k -> 10k
  static RegExp removeLastDotZero() {
    return RegExp(r'([.]*0)(?!.*\d)');
  }
}
