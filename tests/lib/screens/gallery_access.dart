import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({super.key});

  @override
  State<GalleryAccess> createState() => _GalleryAccessState();
}

class _GalleryAccessState extends State<GalleryAccess> {
  File? galleryFile;
  String str = '';
  
  @override
  Widget build(BuildContext context) {

    Future<void> pickImage() async {
      try {
        final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxHeight: 640,
          maxWidth: 640,
        );

        if(image == null) return;

        final imageTemp = File(image.path);
        
        setState(() => galleryFile = imageTemp);
            
      } on PlatformException catch(e) {
        log('Failed to pick image: $e');
      }
    }

    String encodeImage(String imagePath) {
      File imageFile = File(imagePath);
      List<int> imageBytes = imageFile.readAsBytesSync();
      String encodedImage = base64Encode(imageBytes);
      return encodedImage;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Access'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            galleryFile == null ? const Text('Sem imagem') : Image.file(galleryFile!),
            galleryFile == null ? const SizedBox.shrink() : Text(galleryFile!.path),
            ElevatedButton(
              onPressed: () => pickImage(),
              child: const Text('Clique aqui'),
            ),
            ElevatedButton(
              onPressed: () {
                if (galleryFile != null) {
                  str = encodeImage(galleryFile!.path);
                }
              },
              child: const Text('Converta'),
            ),
          ],
        ),
      ),
    );
  }
}
