import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //var to store user type
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
              hintText: 'Hello there BOT!',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: () {
                    //clear text
                    _textController.clear();
                  },
                  icon: const Icon(Icons.clear))),
        )
      ]),
    ));
  }
}
