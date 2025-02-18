import 'package:demo/pages/aboutlisttitle.dart';
import 'package:demo/pages/absorsionbotton.dart';
import 'package:demo/pages/alertdialog.dart';
import 'package:demo/pages/myalign.dart';
import 'package:demo/pages/myalignanimate.dart';
import 'package:demo/pages/page2.dart';
import 'package:demo/pages/showaboutdialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyAboutShowDialog(),
              MyAboutListTitle(),
              MyAbsobBotton(),
              MyAlertDialog(),
              Myaling(),
              MyAlignAnimate(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Page2()));
                  },
                  child: Text("P2"))
            ],
          ),
        ),
      ),
    );
  }
}
