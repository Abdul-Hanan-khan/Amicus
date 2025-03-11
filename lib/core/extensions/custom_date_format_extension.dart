import "package:intl/intl.dart";

extension CustomDateFormat on String {
  String toCustomDateFormat({required String requiredFormat}) {
    try {
      DateTime date = DateTime.parse(this);
      return DateFormat(requiredFormat).format(date);
    } catch (e) {
      return this;
    }
  }
}