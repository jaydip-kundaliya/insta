import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as time_ago;

extension DataTimeConvert on DateTime {
  String toBasicString() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String toTimeAgo() {
    return time_ago.format(this, allowFromNow: true);
  }
}
