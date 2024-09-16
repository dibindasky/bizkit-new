// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'dart:io';

// class AudioRecorderHandler {
//   FlutterSoundRecorder? _recorder;
//   bool isRecording = false;
//   String? recordedFilePath;

//   AudioRecorderHandler() {
//     _recorder = FlutterSoundRecorder();
//   }

//   // Initialize the recorder and request permission
//   Future<void> initRecorder() async {
//     await Permission.microphone.request();
//     if (await Permission.microphone.isGranted) {
//       await _recorder!.openAudioSession();
//     } else {
//       throw RecordingPermissionException("Microphone permission denied.");
//     }                                                        
//   }

//   // Start recording
//   Future<void> startRecording() async {
//     try {
//       if (_recorder!.isRecording) return;
//       Directory tempDir = Directory.systemTemp;
//       String filePath = '${tempDir.path}/audio_record.aac';

//       await _recorder!.startRecorder(
//         toFile: filePath,
//         codec: Codec.aacADTS,
//       );
//       recordedFilePath = filePath;
//       isRecording = true;
//     } catch (e) {
//       print("Error starting recording: $e");
//     }
//   }

//   // Stop recording
//   Future<void> stopRecording() async {
//     try {
//       if (!_recorder!.isRecording) return;
//       await _recorder!.stopRecorder();
//       isRecording = false;
//     } catch (e) {
//       print("Error stopping recording: $e");
//     }
//   }

//   // Dispose of the recorder
//   void dispose() {
//     _recorder!.();
//     _recorder = null;
//   }
// }
