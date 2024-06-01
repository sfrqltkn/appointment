//this basically is to convert date/day/time from calendar to string
import 'package:easy_localization/easy_localization.dart';

class DateConverted {
  static String getDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  static String getDay(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Sunday';
    }
  }

  static String getTime(int time) {
    switch (time) {
      case 0:
        return '10:00 AM';
      case 1:
        return '11:00 AM';
      case 2:
        return '12:00 PM';
      case 3:
        return '13:00 PM';
      case 4:
        return '14:00 PM';
      case 5:
        return '15:00 PM';
      case 6:
        return '16:00 PM';
      case 7:
        return '17:00 PM';
      case 8:
        return '18:00 PM';
      case 9:
        return '19:00 PM';
      default:
        return '10:00 AM';
    }
  }
}
