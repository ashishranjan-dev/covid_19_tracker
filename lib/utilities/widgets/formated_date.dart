  import 'package:intl/intl.dart';

String formattedNumber({required int number}) {
    String tnumber = NumberFormat.compact().format(number);

    return tnumber;
  }