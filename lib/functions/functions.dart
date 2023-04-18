import 'package:spotify/constants/constants.dart';

String dateTimeGreeting() {
  String res = "";
  var dateTime = DateTime.now();
  var time = dateTime.hour.toString();
  int hour = int.parse(time);
  if (hour >= 1 && hour <= 6) {
    res = StringConstants.superMorning;
  } else if (hour > 6 && hour <= 12) {
    res = StringConstants.goodMorning;
  } else if (hour > 12 && hour <= 18) {
    res = StringConstants.goodAfterNoon;
  } else if (hour > 18 && hour <= 24) {
    res = StringConstants.goodEvening;
  }
  return res;
}
