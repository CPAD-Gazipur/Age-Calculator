import 'package:get/get.dart';

class AgeCalculatorController extends GetxController {
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

  final age = "".obs;

  void calculateAge() {
    var days = endDate.value.difference(startDate.value).inDays;
    var year = (days / 365).floor();
    var month = ((days % 365) / 30).floor();
    var day = ((days % 365) % 30).floor();

    age.value = "$year years $month months $day days";
  }

  String getStartDate() {
    int year = startDate.value.year;
    int month = startDate.value.month;
    int day = startDate.value.day;
    return "$day-$month-$year";
  }

  String getEndDate() {
    int year = endDate.value.year;
    int month = endDate.value.month;
    int day = endDate.value.day;
    return "$day-$month-$year";
  }
}
