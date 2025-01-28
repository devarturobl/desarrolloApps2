import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter layout demo'),
            centerTitle: true,
          ),
          body:
              //Nodo Padre principal
              Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Hijo 1 imagen
              Image.network(
                  "https://www.invertour.com.mx/wp-content/uploads/2023/09/suiza-mejores-paises-mundo.jpg"),
              SizedBox(
                height: 30,
              ),
              //Hio 2 Fila
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Hijo 1 de la fila
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Hijo 1 de la Columna
                      Text("Oeschinen Lake Campground",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        "Kandersteg, Suiza",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  //Hijo 2 de la fila
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      Text("41"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              //Hijo 3 de la columna
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.king_bed,
                        color: Colors.purple,
                      ),
                      Text(
                        "Hotel",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: Colors.purple,
                      ),
                      Text(
                        "Comida",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.directions_car,
                        color: Colors.purple,
                      ),
                      Text(
                        "Transporte",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              //Hijo 4 de la columna
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Text(
                  "Descripcion de Suiza Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec purus ac libero ultricies tincidunt. Nullam nec purus ac libero ultricies tincidunt. Nullam nec purus ac libero",
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Text(
                  "Descripcion de Suiza Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec purus ac libero ultricies tincidunt. Nullam nec purus ac libero ultricies tincidunt. Nullam nec purus ac libero",
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )),
    );
  }
}
