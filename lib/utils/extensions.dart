import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as time_ago;

import 'regular_expression.dart';

extension DataTimeConvert on DateTime {
  String toBasicString() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String toTimeAgo() {
    return time_ago.format(this, allowFromNow: true);
  }
}

/// Digit convertor
///
/// Convert int digit into readable form
///
/// like for 1000 -> 1 k (1 thousand)
/// 1000000 -> 1 m (1 million)
extension DigitFormatter on int {
  String toReadable() {
    RegExp regex = AppRegex.removeLastDotZero();
    switch (toString().length) {
      case 4:
        return '${(this / 1000).toStringAsFixed(1)} k'.replaceAll(regex, '');
      case 5:
        return '${(this / 1000).toStringAsFixed(1)} k'.replaceAll(regex, '');
      case 6:
        return '${(this / 1000).toStringAsFixed(1)} k'.replaceAll(regex, '');
      case 7:
        return '${(this / 100000).toStringAsFixed(1)} m'.replaceAll(regex, '');
      default:
        return '';
    }
  }
}
