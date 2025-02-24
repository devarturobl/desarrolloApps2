import 'package:flutter/material.dart';

class Mylist2 extends StatefulWidget {
  Mylist2({super.key});

  @override
  State<Mylist2> createState() => _Mylist2State();
  final List milista = [
    'Melón',
    'Sandia',
    'Pera',
    'Manzana',
    'Plátano',
    'Naranja',
    'Piña',
    'Fresa',
    'Uva',
    'Mango',
    'Papaya',
    'Coco'
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
                child: Column(
              children: [
                Image.asset('assets/${widget.milista[index]}.jpg'),
                Text(
                  widget.milista[index],
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}

class Borrar extends StatefulWidget {
  const Borrar({super.key});

  @override
  State<Borrar> createState() => _BorrarState();
}

class _BorrarState extends State<Borrar> {
  final String texto = 'Hola';
  final List milistas = [
    'Melón',
    'Sandia',
    'Pera',
    'Manzana',
    'Plátano',
    'Naranja',
    'Piña',
    'Fresa',
    'Uva',
    'Mango',
    'Papaya',
    'Coco'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(milistas[0]),
    );
  }
}
