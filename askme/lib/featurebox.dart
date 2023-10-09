import 'package:askme/colors.dart';
import 'package:flutter/material.dart';

class featurebox extends StatelessWidget {
  final Color color;
  final String firsttext;
  final String secondtext;
  const featurebox(
      {super.key,
      required this.color,
      required this.firsttext,
      required this.secondtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                firsttext,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Pallete.blackColor,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                secondtext,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Pallete.blackColor,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
