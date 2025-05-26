import 'package:flutter/material.dart';
import 'package:juegomath/const.dart';
import 'package:juegomath/util/number_key.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'Del',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];

  //user anwer
  String userAnswer = '4';

  void buttonTapped(String button) {
    setState(() {
      userAnswer += button;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),
          Expanded(
              child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //quiestion
                  Text('1 + 1 = ', style: whiteTextStyle),
                  //answer
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.deepPurple[400]),
                    child: Center(
                      child: Text(
                        userAnswer,
                        style: whiteTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
