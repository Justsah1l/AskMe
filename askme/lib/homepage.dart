import 'package:askme/colors.dart';
import 'package:askme/featurebox.dart';
import 'package:askme/openai.dart';
import 'package:askme/widgets/textfield.dart';
import 'package:neopop/neopop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'chatui.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  String? gencontent;
  bool toshow = false;
  TextEditingController textcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "AskMe",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.menu),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 128,
                      width: 129,
                      margin: EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/chatgptlogo.png'),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
                decoration: BoxDecoration(
                    border: Border.all(color: Pallete.borderColor),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  gencontent == null
                      ? "AskMe is powered by state-of-the-art ChatGPT technology, this app is your ultimate conversational companion, capable of understanding and responding to your queries in a natural, human-like manner."
                      : gencontent!,
                  style: TextStyle(
                      color: Pallete.mainFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                visible: gencontent == null,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(top: 5, left: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "Try it your self",
                          style: TextStyle(
                              color: Pallete.mainFontColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        Icon(Icons.arrow_downward_sharp)
                      ],
                    ),
                  ),
                ),
              ),
              NeoPopTiltedButton(
                isFloating: true,
                onTapUp: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Chatui()));
                },
                decoration: const NeoPopTiltedButtonDecoration(
                  color: Color.fromRGBO(255, 235, 52, 1),
                  plunkColor: Color.fromRGBO(255, 235, 52, 1),
                  shadowColor: Color.fromRGBO(36, 36, 36, 1),
                  showShimmer: true,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 120.0,
                    vertical: 15,
                  ),
                  child: Text(
                    'Get started',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
