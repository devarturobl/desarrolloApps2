import 'package:flutter/material.dart';

class MyAboutListTitle extends StatefulWidget {
  const MyAboutListTitle({super.key});

  @override
  State<MyAboutListTitle> createState() => _MyAboutListTitleState();
}

class _MyAboutListTitleState extends State<MyAboutListTitle> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AboutListTile(
        icon: Icon(
          Icons.android,
          color: Colors.green,
        ),
        applicationName: "Demo com Widgets de Flutter",
        applicationLegalese: '© 2025 Flutter',
        applicationVersion: 'version 1.0.0',
        aboutBoxChildren: [
          Text('Demo com Widgets de Flutter é um aplicativo de exemplo.'),
          Text('Este aplicativo é de código aberto.'),
          Text('Puedes encontrar el codigo fuente en GitHub.'),
        ],
      ),
    );
  }
}
