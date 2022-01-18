import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/age_calculator_controller.dart';

class AgeCalculatorView extends GetView<AgeCalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgeCalculatorView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Age : ${controller.age.value}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Start Date'),
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(
                        const Duration(days: 0),
                      ),
                      firstDate: DateTime.now().add(
                        const Duration(days: -30000),
                      ),
                      lastDate: DateTime.now().add(
                        const Duration(days: 3000),
                      ),
                    );
                    controller.startDate.value = date!;
                  },
                ),
                Obx(
                  () => Text(controller.getStartDate()),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text('End Date'),
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(
                        const Duration(days: 0),
                      ),
                      firstDate: DateTime.now().add(
                        const Duration(days: -30000),
                      ),
                      lastDate: DateTime.now().add(
                        const Duration(days: 3000),
                      ),
                    );
                    controller.endDate.value = date!;
                  },
                ),
                Obx(
                  () => Text(controller.getEndDate()),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text('Calculate'),
                  onPressed: () {
                    controller.calculateAge();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
