// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

// class PickImage {
//   static Future<ImageModel?> getImageFromGallery() async {
//     XFile? pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       final fileImage = File(pickedImage.path);
//       return ImageModel(
//         fileImage: fileImage,
//         multipartFile: await MultipartFile.fromFile(fileImage.path),
//       );
//     }
//     return null;
//   }
// }
