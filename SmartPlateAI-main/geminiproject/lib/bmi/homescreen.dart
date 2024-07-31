import 'dart:async';
import 'dart:math';

import 'package:geminiproject/bmi/age_width_height_widget.dart';
import 'package:geminiproject/bmi/gender_widget.dart';
import 'package:geminiproject/bmi/height_widget.dart';
import 'package:geminiproject/bmi/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator" , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(),
            child: Column(
              children: [
                // Gender selection widget
                GenderWidget(
                  onChange: (genderVal) {
                    setState(() {
                      _gender = genderVal;
                    });
                  },
                ),

                // Height selection widget
                HeightWidget(
                  onChange: (heightVal) {
                    setState(() {
                      _height = heightVal;
                    });
                  },
                ),

                // Age and Weight selection widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeightWidget(
                      onChange: (ageVal) {
                        setState(() {
                          _age = ageVal;
                        });
                      },
                      title: "Age",
                      initValue: 30,
                      min: 0,
                      max: 100,
                    ),
                    AgeWeightWidget(
                      onChange: (weightVal) {
                        setState(() {
                          _weight = weightVal;
                        });
                      },
                      title: "Weight(Kg)",
                      initValue: 50,
                      min: 0,
                      max: 200,
                    ),
                  ],
                ),

                // Swipeable button
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: GestureDetector(
                    onTap: () async {
                      // Calculate BMI
                      calculateBmi();

                      // Navigate to ScoreScreen
                      await Navigator.push(
                        context,
                        PageTransition(
                          child: ScoreScreen(
                            bmiScore: _bmiScore,
                            age: _age,
                          ),
                          type: PageTransitionType.fade,
                        ),
                      );

                      // Reset isFinished state
                      setState(() {
                        _isFinished = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: _isFinished ? 80 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _isFinished ? Colors.green : Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: _isFinished
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "CALCULATE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
