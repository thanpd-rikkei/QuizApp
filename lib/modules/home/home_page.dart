import 'package:bai_tap_vn_s3/constants/screen_step.dart';
import 'package:bai_tap_vn_s3/models/question.dart';
import 'package:bai_tap_vn_s3/widgets/init.dart';
import 'package:bai_tap_vn_s3/widgets/quiz.dart';
import 'package:bai_tap_vn_s3/widgets/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _numQuiz = 0;
  int _percentPoint = 0;
  ScreenStep _screenStep = ScreenStep.init;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: render()),
    );
  }

  Widget render() {
    if (_screenStep == ScreenStep.quiz) {
      return Quiz(numQuiz: _numQuiz, percentPoint: _percentPoint, reply: reply);
    } else if (_screenStep == ScreenStep.result) {
      return Result(percentPoint: _percentPoint, restart: restart);
    } else {
      return Init(start: start);
    }
  }

  void reply(int percentPoint) {
    if (_numQuiz < questions.length - 1) {
      setState(() {
        _numQuiz++;
        _percentPoint += percentPoint;
      });
    } else {
      setState(() {
        _screenStep = ScreenStep.result;
        _percentPoint += percentPoint;
      });
    }
  }

  void start() {
    setState(() {
      _screenStep = ScreenStep.quiz;
    });
  }

  void restart() {
    setState(() {
      _screenStep = ScreenStep.init;
      _percentPoint = 0;
      _numQuiz = 0;
    });
  }
}
