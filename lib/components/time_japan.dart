import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';


class TimeJapan {

  String sentDateFormatted(String timestamp) {
    initializeDateFormatting("ja_JP");
    DateTime datetime = DateTime.parse(timestamp);
    var formatter = new DateFormat('yyyy年MM月dd日(E) HH:mm', "ja_JP");
    var formatted = formatter.format(datetime); // DateからString
    return formatted;
  }
}
