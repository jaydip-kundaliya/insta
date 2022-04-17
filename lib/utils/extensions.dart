import 'package:intl/intl.dart';

extension DataTimeConvert on DateTime {
  String toBasicString() {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}
