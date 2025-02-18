import 'package:flutter/material.dart';

class MyAboutShowDialog extends StatefulWidget {
  const MyAboutShowDialog({super.key});

  @override
  State<MyAboutShowDialog> createState() => _MyAboutShowDialogState();
}

class _MyAboutShowDialogState extends State<MyAboutShowDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AboutDialog(
                          applicationName: "Widgets de Flutter",
                          applicationLegalese: "© 2025 Flutter",
                          applicationIcon: Icon(
                            Icons.android,
                            color: Colors.green,
                          ),
                          applicationVersion: "version 1.0.0",
                          children: [
                            Text(
                                "Widgets de Flutter es una aplicación de ejemplo."),
                            Text("Esta aplicación es de código abierto."),
                            Text(
                                "Puedes encontrar el código fuente en GitHub."),
                          ]));
            },
            child: Text("Show About Dialog")));
  }
}
