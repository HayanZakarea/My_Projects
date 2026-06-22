
import 'package:intl/intl.dart';

extension DateFormating on DateTime {

  String get dateFormated => DateFormat().format(this);

  String dateFormatedBy(String format) => DateFormat(format).format(this);

}