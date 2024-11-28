import 'dart:convert';
import 'dart:io';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_details_responce/visiting_card_details_responce.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class SharePlus {
  static Future<void> sharePdfFromBase64(
      String pdfBase64String, String additionalData) async {
    // Decode base64 string to Uint8List
    Uint8List pdfData = base64Decode(pdfBase64String);

    // Save PDF data to a temporary file
    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/bizkit_$additionalData.pdf');
    await tempFile.writeAsBytes(pdfData);

    // Share PDF file
    await Share.shareXFiles([XFile(tempFile.path)]);
  }

  static Future<void> shareVisitingCardDetails(
      VisitingCardDetailsResponce card) async {
    // Build the text data to share
    String shareText = '''
    Name: ${card.name ?? "N/A"}
    Company: ${card.company ?? "N/A"}
    Phone Number: ${card.phoneNumber ?? "N/A"}
    Website: ${card.website ?? "N/A"}
    Designation: ${card.designation ?? "N/A"}
    Email: ${card.email ?? "N/A"}
    Occation: ${card.occation ?? "N/A"}
    Location: ${card.location ?? "N/A"}
    Occupation: ${card.occupation ?? "N/A"}
    Notes: ${card.notes ?? "N/A"}
  ''';

    // Decode base64 image if available
    if (card.cardImage != null && card.cardImage!.isNotEmpty) {
      final decodedImage = base64Decode(card.cardImage!);

      // Get the temporary directory to store the image file
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/shared_card_image.png';

      // Write the decoded image to a file
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(decodedImage);

      // Share both the text and the image
      await Share.shareFiles([imageFile.path], text: shareText);
    } else {
      // Share only the text if there's no image
      await Share.share(shareText);
    }
  }
}
