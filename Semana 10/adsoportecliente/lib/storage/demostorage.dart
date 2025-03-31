import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Demostorage extends StatefulWidget {
  const Demostorage({super.key});

  @override
  State<Demostorage> createState() => _DemostorageState();
}

class _DemostorageState extends State<Demostorage> {
  File? _imageFile;

  //pick Image
  Future pickImage() async {
    //picker
    final ImagePicker picker = ImagePicker();

    //pick from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    //update image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future uploadImage() async {
    if (_imageFile == null) return;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = "uploads/$fileName";

    await Supabase.instance.client.storage
        .from("images")
        .upload(path, _imageFile!)
        .then((value) =>
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Imagen subida con exito"),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Almacenamiento de datos"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Almacenamiento de datos"),
            _imageFile != null
                ? Image.file(_imageFile!)
                : const Text("No hay imagen seleccionada"),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Seleccionar imagen"),
            ),
            ElevatedButton(
              onPressed: uploadImage,
              child: const Text("Subir imagen"),
            ),
          ],
        ),
      ),
    );
  }
}
