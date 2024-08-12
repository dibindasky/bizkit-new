// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:bizkit/module/task/application/presentation/screens/generate_report/widgets/excel_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:open_file/open_file.dart';
// // import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// Future<bool> takePermission() async {
//   Map<Permission, PermissionStatus> statuses = await [
//     Permission.storage,
//     //add more permission to request here.
//   ].request();
//   if (statuses[Permission.storage]!.isGranted) {
//     return true;
//   } else {
//     return false;
//   }
// }

// Future<void> pdfAndExcelGenerator(
//     {required String base64String,
//     required String filetype,
//     required BuildContext context}) async {
//   try {
//     final per = await takePermission();
//     if (!per) {
//       log("Permission denied.");
//       return;
//     }
//     var dir = await getExternalStorageDirectory();
//     if (dir != null) {
//       String savePath = '${dir.path}/TaskReport.$filetype';
//       log('Saving PDF or Excel to: $savePath');

//       var bytes = base64.decode(base64String.replaceAll("\n", ''));

//       final file = File(savePath);
//       await file.writeAsBytes(bytes);
//       log('File Path: ${file.path}');

//       if (filetype == 'pdf') {
//         await OpenFile.open(file.path);
//       } else if (filetype == 'excel') {
//         Navigator.of(context).push(
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

// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// Request necessary permissions
Future<bool> takePermission() async {
  if (Platform.isAndroid) {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else if (await Permission.manageExternalStorage.request().isGranted) {
      return true;
    }
  } else if (Platform.isIOS) {
    // iOS specific permission handling
    if (await Permission.photos.request().isGranted) {
      return true;
    }
  }
  return false;
}

// Function to handle PDF and Excel generation
Future<void> pdfAndExcelGenerator({
  required String base64String,
  required String filetype,
  required BuildContext context,
}) async {
  try {
    final per = await takePermission();
    if (!per) {
      log("Permission denied.");
      return;
    }

    Directory? dir;

    // Use appropriate directory based on Android version
    if (Platform.isAndroid) {
      dir = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    }

    if (dir != null) {
      String savePath = '${dir.path}/TaskReport.$filetype';
      log('Saving $filetype to: $savePath');

      var bytes = base64.decode(base64String.replaceAll("\n", ''));

      final file = File(savePath);
      await file.writeAsBytes(bytes);
      log('File Path: ${file.path}');

      filetype == 'excel' ? filetype = 'xlsx' : filetype = '';

      if (filetype == 'pdf') {
        await OpenFile.open(file.path);
      } else if (filetype == 'xlsx') {
        await OpenFile.open(file.path);
        // if (context.mounted) {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) => ExcelViewerScreen(filePath: file.path),
        //     ),
        //   );
        // }
      } else {
        log("Unsupported file type.");
      }
    } else {
      log("Directory is null, no permission to read/write.");
    }
  } on PlatformException catch (e) {
    log('Platform Exception: ${e.message}');
  } catch (e) {
    log('Error generating PDF or Excel: $e');
  }
}
