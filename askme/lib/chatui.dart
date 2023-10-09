import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import './widgets/textfield.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:askme/openai.dart';
import 'colors.dart';
import 'package:askme/homepage.dart';

class Chatui extends StatefulWidget {
  const Chatui({super.key});

  @override
  State<Chatui> createState() => _ChatuiState();
}

class Messagess {
  final String text;
  final bool mesend;

  Messagess({
    required this.text,
    required this.mesend,
  });
}

class _ChatuiState extends State<Chatui> {
  String? gencon;
  List<Messagess> messages = [
    //Messagess(text: "sample text", mesend: true),
    Messagess(text: "Hello , how can i help you ?", mesend: false)
  ];
  void txtadd() {
    final message0 = Messagess(text: textcontrol.text, mesend: true);
    messages.add(message0);
  }

  void tadd() async {
    final ans = await openai().chatgpt(textcontrol.text);

    final message1 = Messagess(text: ans, mesend: false);
    setState(() {
      gencon = ans;

      messages.add(message1);
      textcontrol.clear();
    });
  }

  TextEditingController textcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "AskMe",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView(
            elements: messages,
            groupBy: (Message) => DateTime(2023),
            groupHeaderBuilder: (Messagess messagess) => SizedBox(),
            itemBuilder: (context, Messagess messagess) => Align(
              alignment: messagess.mesend
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                elevation: 1,
                margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                color: messagess.mesend
                    ? Pallete.whiteColor
                    : Color.fromARGB(255, 36, 189, 255),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    messagess.text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
          )),
          Row(
            children: [
              textwalafield(textcontrol),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: new IconButton(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    icon: new Icon(Icons.send),
                    onPressed: () async {
                      txtadd();
                      tadd();
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
