import 'package:flutter/material.dart';
import 'package:month_calculator/month_calculator.dart';
import 'package:get/get.dart';

class AgeCalculatorController extends GetxController {
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

  final age = 0.0.obs;

  void calculateAge() {
    var dateRange = DateTimeRange(start: startDate.value, end: endDate.value);
    var months = MonthCalculator.monthsInRange(dateRange).months;
    age.value = months / 12;
  }
}
