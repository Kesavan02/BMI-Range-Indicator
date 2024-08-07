import 'package:demo_bmi/US units.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'Metric Units.dart';

void main() {
  runApp(MediaQuery(
      data: MediaQueryData.fromView(ui.window),
      child: const Directionality(
        textDirection: TextDirection.ltr,
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: metrics(),
    );
  }
}

class metrics extends StatelessWidget {
  metrics({super.key});

  var obj = const BmiCalculator1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        elevation: 0.0,
        title: const Text(
          'BMI Calculator',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(1, 2),
              color: Colors.black,
              blurRadius: 2.0,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 150.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: Colors.purple[100],
                  ),
                  child: Column(
                    children: [
                      textButton(context, const MetricUnit(), 'Metric Units'),
                      textButton(context, const USUnit(), 'US Units'),
                      const Row(
                        children: [],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textButton(BuildContext context, widget, text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.purple[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
