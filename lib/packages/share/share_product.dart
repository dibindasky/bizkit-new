// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:path_provider/path_provider.dart';

// class ShareItem {
//   Future<void> shareProduct(String imageUrl, String text) async {
//     try {
//       final downloadedImagePath = await downloadImage(imageUrl);
//       await shareDownloadedImage(downloadedImagePath, text);
//     } catch (e) {
//       print('Error sharing product: $e');
//       // Handle errors appropriately, e.g., show a user-friendly message
//     }
//   }

//   Future<String> downloadImage(String imageUrl) async {
//     final dio = Dio();
//     final tempDir = await getTemporaryDirectory();
//     final filename = basename(imageUrl); // Extract filename from URL
//     final filePath = '${tempDir.path}/$filename';
//     final response = await dio.download(
//       imageUrl,
//       filePath,
//       options: DownloadOptions(fileName: filename),
//     );
//     if (response.statusCode == 200) {
//       return filePath;
//     } else {
//       throw Exception('Failed to download image: ${response.statusCode}');
//     }
//   }

//   Future<void> shareDownloadedImage(String filePath, String text) async {
//     final shareContent = Share(
//       subject: 'Share this product!',
//       text: text,
//       filePath: filePath,
//     );
//     await SharePlus.share(shareContent);
//   }
// }
