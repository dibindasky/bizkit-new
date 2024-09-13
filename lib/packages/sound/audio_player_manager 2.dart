import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class AudioPlayerManager {
  final AudioPlayer _player = AudioPlayer();
  String? _filePath;

  // Duration of the audio
  Duration? _audioDuration;
  Duration _currentPosition = Duration.zero;

  // Getters for duration and current position
  Duration? get audioDuration => _audioDuration;
  Duration get currentPosition => _currentPosition;

  // Play audio from a Base64 string
  Future<void> playAudioFromBase64(String? base64String) async {
    if (base64String == null) return;
    // Decode the Base64 string
    final bytes = base64Decode(base64String);

    // Get the temporary directory
    final directory = await getTemporaryDirectory();

    // Create a unique filename using the current timestamp
    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    _filePath =
        '${directory.path}/audio_$timestamp.aac'; // Change extension if needed

    // Write the bytes to a file
    final file = File(_filePath!);
    await file.writeAsBytes(bytes);

    // Set the audio source from the file
    await _player.setSourceDeviceFile(_filePath!);

    // Get the duration of the audio
    _audioDuration = await _player.getDuration();

    // Play the audio from the file
    await _player.play(DeviceFileSource(_filePath!));

    // Listen to position updates
    _player.onPositionChanged.listen((position) {
      _currentPosition = position;
      // You can call a method here to update the UI if needed
    });

    // Optionally, you can handle completion
    _player.onPlayerComplete.listen((event) {
      print('Audio playback completed');
      _currentPosition = Duration.zero; // Reset current position
      // You can call a method here to update the UI if needed
    });
  }

  // Pause audio playback
  Future<void> pauseAudio() async {
    await _player.pause();
  }

  // Resume audio playback
  Future<void> resumeAudio() async {
    await _player.resume();
  }

  // Stop audio playback
  Future<void> stopAudio() async {
    await _player.stop();
    _currentPosition = Duration.zero; // Reset current position
    // You can call a method here to update the UI if needed
  }

  // Dispose resources
  void dispose() {
    _player.dispose();
  }
}
