import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//class ImagePage extends StatelessWidget {
//const ImagePage({super.key});
//@override
//}
class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ComponentPage();
}

class _ComponentPage extends State<ImagePage> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Image Picker from Gallery"),
            backgroundColor: Colors.redAccent),
        body: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        final img = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          image = img;
                        });
                      },
                      label: const Text('Choose Image'),
                      icon: const Icon(Icons.image),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        final img =
                            await _picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          image = img;
                        });
                      },
                      label: const Text('Take Photo'),
                      icon: const Icon(Icons.camera_alt_outlined),
                    ),
                  ],
                ),
                if (image != null)
                  Expanded(
                    child: Column(
                      children: [
                        //This will show image on to the screen
                        Expanded(child: Image.file(File(image!.path))),

                        //This will remove image from the UI
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              image = null; //this is important
                            });
                          },
                          label: const Text('Remove Image'),
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                  )
                else
                  const SizedBox(),
              ],
            )));
  }
}
