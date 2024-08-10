import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


Future<bool> takePermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
    //add more permission to request here.
  ].request();
  if (statuses[Permission.storage]!.isGranted) {
    return true;
  } else {
    return false;
  }
}

Future<void> pdfAndExcelGenerator(String base64String, String filetype) async {
  try {
    final per = await takePermission();
    if (!per) {
      takePermission();
      return;
    }
    var dir =
        await getExternalStorageDirectory(); // Use getExternalStorageDirectory() instead of DownloadsPathProvider
    if (dir != null) {
      String savePath =
          '${dir.path}/file.$filetype'; // Simplify the savePath generation
      log('Saving  PDF OR EXCEL to: $savePath');

      var bytes = base64.decode(base64String.replaceAll(
          "\n", '')); // Use base64.decode instead of base64Decode

      final file = File(savePath);
      await file.writeAsBytes(bytes);
      log(' PDF OR EXCEL Path: ${file.path}');
      // await OpenFile.open(file.path); 

      
    } else {
      log("No permission to read and write.");
    }
  } on PlatformException catch (e) {
    log('Platform Exception: ${e.message}');
  } catch (e) {
    log('Error generating PDF OR EXCEL: $e');
  }
}

// Future<void> pdfAndExcelGenerator({required String base64String,required String filetype,required BuildContext context}) async {
//   try {
//     final per = await takePermission();
//     if (!per) {
//       log("Permission denied.");
//       return;
//     }
//     var dir = await getExternalStorageDirectory(); 
//     if (dir != null) {
//       String savePath = '${dir.path}/file.$filetype'; 
//       log('Saving PDF or Excel to: $savePath');

//       var bytes = base64.decode(base64String.replaceAll("\n", '')); 

//       final file = File(savePath);
//       await file.writeAsBytes(bytes);
//       log('File Path: ${file.path}');
      
//       if (filetype == 'pdf') {
//         Navigator.of(context).push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => PDFViewerScreen(filePath: file.path),
//           ),
//         );
//       } else if (filetype == 'xlsx') {
//         Navigator.of(context).push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ExcelViewerScreen(filePath: file.path),
//           ),
//         );
//       } else {
//         log("Unsupported file type.");
//       }
//     } else {
//       log("No permission to read and write.");
//     }
//   } on PlatformException catch (e) {
//     log('Platform Exception: ${e.message}');
//   } catch (e) {
//     log('Error generating PDF or Excel: $e');
//   }
// }
