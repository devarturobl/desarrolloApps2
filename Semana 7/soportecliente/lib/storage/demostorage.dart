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

  Future pickImage() async {
    //pick image

    final ImagePicker _picker = ImagePicker();

    //pick image from gallery
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    //update image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  //upload
  Future uploadImage() async {
    //upload image
    if (_imageFile == null) return;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'uploads/$fileName';

    await Supabase.instance.client.storage
        .from('images')
        .upload(path, _imageFile!)
        .then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Image Upload Sucessfully"))));
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
              _imageFile != null
                  ? Image.file(_imageFile!)
                  : Text("No hay imagen Seleccionada"),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text("Seleccionar Imagen"),
              ),
              ElevatedButton(
                onPressed: uploadImage,
                child: const Text("Subir Imagen"),
              )
            ],
          ),
        ));
  }
}
