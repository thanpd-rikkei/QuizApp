import 'package:bai_tap_vn_s3/constants/assets_path.dart';
import 'package:bai_tap_vn_s3/models/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final int numQuiz;
  final int percentPoint;
  final ValueSetter<int> reply;

  const Quiz({super.key, required  this.numQuiz, required this.percentPoint, required this.reply});

  @override
  Widget build(BuildContext context) {
    String question = questions[numQuiz]["question"];
    Map answers = questions[numQuiz]["answer"];
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(AssetPath.bgQuiz),
                    fit: BoxFit.cover,
                  ),
                ),
                constraints: const BoxConstraints(minHeight: 200),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(question),
                  ),
                )),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Column(
                children: answers.keys
                    .map<Widget>((answer) => Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                              onPressed: () {
                                reply(answers[answer]);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Theme.of(context).primaryColor)),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  answer,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )),
                        ))
                    .toList())
          ],
        ));
  }
}
