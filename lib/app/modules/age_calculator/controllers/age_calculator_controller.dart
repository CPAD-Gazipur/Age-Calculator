import 'package:flutter/material.dart';
import 'package:month_calculator/month_calculator.dart';
import 'package:get/get.dart';

class AgeCalculatorController extends GetxController {
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

  // final sty = DateTime(1).obs;
  // final endy = DateTime(365).obs;

  final age = 0.0.obs;
  final age1 = 0000.0.obs;

  void calculateAge() {
    var dateRange = DateTimeRange(start: startDate.value, end: endDate.value);
    var months = MonthCalculator.monthsInRange(dateRange).months;
    // var dayrange = DateTimeRange(start: sty.value, end: endy.value);
    // var days = MonthCalculator.monthsInRange(dayrange).days;
    age.value = months / 12;
    // age1.value = days / 12;
  }
}
