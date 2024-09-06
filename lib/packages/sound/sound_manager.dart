import 'package:flutter_sound/flutter_sound.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart'; // Import path_provider

class SoundManager {
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  bool _isRecorderInitialized = false;
  bool _isPlayerInitialized = false;
  String? _filePath;
  String? _base64Audio;

  SoundManager() {
    _initRecorder();
    _initPlayer();
  }

  SoundManager.player() {
    _initPlayer();
  }

  // Request permissions
  Future<bool> _requestPermissions() async {
    PermissionStatus micStatus = await Permission.microphone.request();
    PermissionStatus storageStatus = await Permission.storage.request();

    if (micStatus.isGranted && storageStatus.isGranted) {
      return true;
    } else {
      print('Permissions not granted');
      return false;
    }
  }

  // Initialize the recorder
  Future<void> _initRecorder() async {
    if (await _requestPermissions()) {
      try {
        _recorder = FlutterSoundRecorder();
        await _recorder!.openRecorder();
        _isRecorderInitialized = true;
      } catch (e) {
        print('Failed to initialize recorder: $e');
      }
    }
  }

  // Initialize the player
  Future<void> _initPlayer() async {
    if (await _requestPermissions()) {
      try {
        _player = FlutterSoundPlayer();
        await _player!.openPlayer();
        _isPlayerInitialized = true;
      } catch (e) {
        print('Failed to initialize player: $e');
      }
    }
  }

  // Get the directory to store the audio file
  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/audio_record.aac';
  }

  // Start recording
  Future<void> startRecording() async {
    if (!_isRecorderInitialized) return;

    try {
      _filePath = await _getFilePath(); // Get the correct file path
      await _recorder!.startRecorder(
        toFile: _filePath,
        codec: Codec.aacADTS,
      );
    } catch (e) {
      print('Failed to start recording: $e');
    }
  }

  // Stop recording and encode to base64
  Future<void> stopRecording() async {
    if (!_isRecorderInitialized) return;

    try {
      await _recorder!.stopRecorder();

      if (_filePath != null) {
        final bytes = await File(_filePath!).readAsBytes();
        _base64Audio = base64Encode(bytes);
      }
    } catch (e) {
      print('Failed to stop recording: $e');
    }
  }

  // Play the base64-encoded audio
  Future<void> playRecording() async {
    if (!_isPlayerInitialized || _base64Audio == null) return;

    try {
      final bytes = base64Decode(_base64Audio!);
      final tempFile = await File(_filePath!).writeAsBytes(bytes);

      await _player!.startPlayer(
        fromURI: tempFile.path,
        codec: Codec.aacADTS,
      );
    } catch (e) {
      print('Failed to play recording: $e');
    }
  }

  // Pause playback
  Future<void> pausePlayback() async {
    if (!_isPlayerInitialized) return;

    try {
      await _player!.pausePlayer();
    } catch (e) {
      print('Failed to pause playback: $e');
    }
  }

  // Resume playback
  Future<void> resumePlayback() async {
    if (!_isPlayerInitialized) return;

    try {
      await _player!.resumePlayer();
    } catch (e) {
      print('Failed to resume playback: $e');
    }
  }

  // Stop playback
  Future<void> stopPlayback() async {
    if (!_isPlayerInitialized) return;

    try {
      await _player!.stopPlayer();
    } catch (e) {
      print('Failed to stop playback: $e');
    }
  }

  // Get the base64-encoded audio
  String? getBase64Audio() => _base64Audio;

  // Dispose resources
  void dispose() {
    try {
      _recorder?.closeRecorder();
      _player?.closePlayer();
    } catch (e) {
      print('Failed to dispose resources: $e');
    }
  }
}
