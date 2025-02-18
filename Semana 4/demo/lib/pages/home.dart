import 'package:demo/pages/aboutlisttitle.dart';
import 'package:demo/pages/absorsionbotton.dart';
import 'package:demo/pages/alertdialog.dart';
import 'package:demo/pages/myalign.dart';
import 'package:demo/pages/myalignanimate.dart';
import 'package:demo/pages/page2.dart';
import 'package:demo/pages/showaboutdialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
