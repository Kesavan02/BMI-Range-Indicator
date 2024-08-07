import 'package:flutter/material.dart';

class MetricUnit extends StatelessWidget {
  const MetricUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiCalculator1(),
    );
  }
}

class BmiCalculator1 extends StatefulWidget {
  const BmiCalculator1({super.key});

  @override
  State<BmiCalculator1> createState() => _MyAppState();
}

class _MyAppState extends State<BmiCalculator1> {
  //This variable is declare for custom radio button
  int currentindex = 0;
  String result = "";
  double height = 0.0;
  double weight = 0.0;
  //Declare the inputController to get the inputs value
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text(
          'Metric Units',
          textDirection: TextDirection.ltr,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.black,
            shadows: [
              Shadow(
                  offset: Offset(1, 2), color: Colors.black, blurRadius: 2.0),
            ],
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        elevation: 0.0,
        backgroundColor: Colors.purple[100],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton('Man', Colors.blue, 0),
                  radioButton('Women', Colors.pink, 1)
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              //Creating the input form
              const Text(
                "Height ",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                //Let's add the controller
                controller: heightController,
                textAlign: TextAlign.center,

                decoration: InputDecoration(
                  focusColor: Colors.grey[200],
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: 'Your height in Cms :',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                        color: Colors.purple, style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Weight ",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                //Let's add the contoller
                controller: weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Your weight in Kgs :',
                  focusColor: Colors.grey[200],
                  filled: true,
                  errorBorder: InputBorder.none,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightController.value.text);
                      weight = double.parse(weightController.value.text);
                      result = calculateBmi(height, weight);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Your BMI is :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String calculateBmi(double height, double weight) {
    double finalresult = ((weight / height) / height) * 10000;
    String bmi = finalresult.toStringAsFixed(2);

    return bmi;
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  //Creating a new custom widget
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        //Add margin to this container
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: TextButton(
          onPressed: () {
            changeIndex(index);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.purple[200],
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            value,
            style: TextStyle(
              color: currentindex != index ? Colors.white : color,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        //Now I want the color of my button change in function of it's selected or not
        //This line means if the current index is equal to the button index then put the color
      ),
    );
  }
}
