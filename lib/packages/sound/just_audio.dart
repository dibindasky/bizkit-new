import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';

class AudioPlayerHandler {
  final AudioPlayer audioPlayer = AudioPlayer();
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration?>? _durationSubscription;
  Duration? totalDuration;
  Duration? currentPosition;

  // Play audio from base64
  Future<bool> playAudioFromBase64(String base64Audio,
      {required Function(Duration currentPosition) onCurrentPositionChanged,
      required VoidCallback whenFinished}) async {
    try {
      // Decode the base64 string into Uint8List (binary data)
      Uint8List audioBytes = base64.decode(base64Audio);

      // Set audio source with appropriate MIME type
      await audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.dataFromBytes(audioBytes, mimeType: 'audio/aac'),
        ),
      );

      // Listen to the total duration of the audio
      _durationSubscription = audioPlayer.durationStream.listen((duration) {
        totalDuration = duration;
        print("Total Duration: $totalDuration");
      });

      // Listen to the current position of the audio while playing
      _positionSubscription = audioPlayer.positionStream.listen((position) {
        currentPosition = position;
        onCurrentPositionChanged(currentPosition!);

        // When audio finishes, invoke the callback
        if (currentPosition == totalDuration) {
          whenFinished();
          currentPosition = Duration.zero;
        }
      });

      // Start playing the audio
      await audioPlayer.play();
      return true;
    } catch (e) {
      print("Error playing audio: $e");
      return false;
    }
  }

  // Pause the audio
  void pauseAudio() {
    try {
      audioPlayer.pause();
    } catch (e) {
      print('Error while pausing audio: $e');
    }
  }

  // Stop the audio
  void stopAudio() {
    try {
      audioPlayer.stop();
    } catch (e) {
      print('Error while stopping audio: $e');
    }
  }

  // Resume the audio
  void resumeAudio() {
    try {
      audioPlayer.play();
    } catch (e) {
      print('Error while resuming audio: $e');
    }
  }

  // Get the total duration of the audio
  Duration? getTotalDuration() {
    return totalDuration;
  }

  // Get the current position of the audio
  Duration? getCurrentPosition() {
    return currentPosition;
  }

  // Dispose resources when no longer needed
  void dispose() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    audioPlayer.dispose();
  }
}
