// import 'package:age_calculator/app/modules/about/views/about_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/age_calculator_controller.dart';

class AgeCalculatorView extends GetView<AgeCalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Age is :",
              style: TextStyle(fontSize: 20),
            ),
            Obx(
              () => Text(
                  " ${controller.age.value}years  ${controller.age2.value} months  ${controller.age1.value} days"),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: OutlinedButton(
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

                          actions:
                          <Widget>[
                            ElevatedButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ];

                          controller.setStartDate(date);
                        },
                      ),
                    ),
                    Obx(
                      () => Text(controller.getStartDate()),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: OutlinedButton(
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
                          actions:
                          <Widget>[
                            ElevatedButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ];
                          controller.setEndDate(date);
                        },
                      ),
                    ),
                    Obx(
                      () => Text(controller.getEndDate()),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    controller.calculateAge();
                  },
                  child: Text(
                    "Calculate",
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
