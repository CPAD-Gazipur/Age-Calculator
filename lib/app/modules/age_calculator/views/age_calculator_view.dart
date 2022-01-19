// import 'package:age_calculator/app/modules/about/views/about_view.dart';
import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/age_calculator_controller.dart';

class AgeCalculatorView extends GetView<AgeCalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF1700),
      appBar: AppBar(
        backgroundColor: Color(0xffFF1700),
        shadowColor: Color(0xFF180101),
        elevation: 45.0,
        title: Text(
          'Age Calculator',
          style: TextStyle(color: Color(0xFFEEEBE7)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Age is :",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE6E5DF)),
              ),
              Container(
                color: Color(0xffFF8E00),
                width: double.infinity,
                child: Obx(
                  () => Center(
                    child: Text(
                      " ${controller.age.value} Years  ${controller.age2.value} Months  ${controller.age1.value} Days",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          wordSpacing: 10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            primary: Color.fromARGB(5, 4, 55, 60),
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            'Start Date',
                            style: TextStyle(
                              letterSpacing: 3.0,
                            ),
                          ),
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
                        () => Text(
                          controller.getStartDate(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent[700],
                          ),
                        ),
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            primary: Color.fromARGB(22, 40, 55, 60),
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            ' End Date ',
                            style: TextStyle(
                              letterSpacing: 3.0,
                            ),
                          ),
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
                        () => Text(
                          controller.getEndDate(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      primary: Color.fromARGB(22, 40, 55, 60),
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      controller.calculateAge();
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
      ),
    );
  }
}
