
// ignore_for_file: omit_local_variable_types

import 'package:learngual_assessment/app.dart';

String dateFormatted() {
  var now = DateTime.now();

  var formatter = DateFormat("EEE, d MMMM, yyyy");
  String formatted = formatter.format(now);

  return formatted;
}

String dateFormatted2(DateTime dateTime) {
  var now = dateTime;

  var formatter = DateFormat("d MMMM, yyyy");
  String formatted = formatter.format(now);

  return formatted;
}

String dateFormattedWithSlash(DateTime dateTime) {
  var now = dateTime;

  var formatter = DateFormat('dd/MM/yyyy');
  String formatted = formatter.format(now);

  return formatted;
}

String timeFormatted(TimeOfDay time) {
  var now = DateTime.now();

  var formatter =
      DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat().add_jm().format(formatter);
}
