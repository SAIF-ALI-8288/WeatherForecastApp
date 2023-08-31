import 'package:intl/intl.dart';

class Util{
  static String appid="116e867c1b86c84eac331cfeaf18dd57";
  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}