import 'package:bai_tap_vn_s3/constants/assets_path.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int percentPoint;
  final VoidCallback restart;
  const Result({super.key, required this.percentPoint, required this.restart});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(AssetPath.bgResult),
                    fit: BoxFit.cover,
                  ),
                ),
                constraints: const BoxConstraints(minHeight: 200),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text.rich(TextSpan(
                        text:
                            "Chỉ số phù hợp giữa bạn và khóa học flutter là: ",
                        children: [TextSpan(text: "$percentPoint%")])),
                  ),
                )),
            const Padding(padding: EdgeInsets.only(top: 10)),
            TextButton(
                onPressed: () {
                  restart();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).primaryColor)),
                child: SizedBox(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      Text(
                        "Bắt đầu lại",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
