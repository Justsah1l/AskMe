import 'package:askme/colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class textwalafield extends StatelessWidget {
  final TextEditingController textEditingController;
  const textwalafield(@required this.textEditingController);

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: 260,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Pallete.borderColor),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type here',
        ),
        controller: textEditingController,
      ),
    ));
  }
}
