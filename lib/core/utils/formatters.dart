import 'package:intl/intl.dart';
import 'package:meta/meta.dart' show required;

String formatTime({@required DateTime? date, String? format = 'jm'}) {
  return DateFormat(format).format(date!.toLocal());
}

/// -default format 1/12/2020
String formatDate({@required DateTime? date, String format = 'dd/MM/yyyy'}) {
  return DateFormat(format).format(date!.toLocal());
}

///  Returns a double formatted to string
///  ```dart
/// formatNumber(1500) == 1.500,00
/// ```
String formatNumber({@required double ?number, int decimalDigits = 0}) {
  return NumberFormat.currency(locale: 'es', symbol: '', decimalDigits: decimalDigits).format(number);
}
