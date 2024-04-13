import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State {
  /// Variables
  File? imageFile;

  /// Widget
  File _file = File("zz");
  Uint8List webImage = Uint8List(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 157, 168, 231),
                        width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child: (_file.path == "zz")
                        ? Image.asset("assets/flutter.png",
                        height: 150, width: 150)
                        : (kIsWeb)
                        ? Image.memory(webImage, height: 150, width: 150)
                        : Image.file(_file, height: 150, width: 150),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: IconButton(
                    onPressed: uploadImage,
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //web imagepicker ....
  uploadImage() async {
    // WEB
    if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _file = File("a");
          webImage = f;
        });
      } else {
        Text("No file selected");
      }
    } else {
      Text("Permission not granted");
    }
    // MOBILE
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);

        setState(() {
          _file = selected;
        });
      } else {
        Text("No file selected");
      }
    }
  }

//   /// Get from Camera
//   _getFromCamera() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   /// Get from gallery
//   _getFromGallery() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
}