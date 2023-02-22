import 'package:flutter/material.dart';

class Init extends StatelessWidget {
  final VoidCallback start;

  const Init({super.key, required this.start});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 200)),
          const Center(
            child: Text(
              "Hello!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          TextButton(
              onPressed: () {
                start();
              },
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white)),
              child: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Bắt đầu",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
