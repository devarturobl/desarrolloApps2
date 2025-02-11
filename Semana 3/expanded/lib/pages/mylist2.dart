import 'package:flutter/material.dart';

class Mylist2 extends StatefulWidget {
  Mylist2({super.key});

  @override
  State<Mylist2> createState() => _Mylist2State();
  final List milista = [
    'post1',
    'post2',
    'post3',
    'post4',
    'post5',
    'post6',
    'post7',
    'post8',
    'post9',
    'post10',
    'post11',
    'post12'
  ];
}

class _Mylist2State extends State<Mylist2> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.milista.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
                child: Text(
              widget.milista[index],
              style: TextStyle(fontSize: 40, color: Colors.white),
            )),
          ),
        );
      },
    );
  }
}
