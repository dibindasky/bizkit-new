import 'dart:async';
import 'dart:developer';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  final String url;
  IOWebSocketChannel? _channel;
  // StreamSubscription? _subscription;
  bool _isReconnecting = false;
  int _retryDelay = 1; // Start with 1 second delay
  final int _maxRetryDelay = 32; // Maximum delay in seconds

  WebSocketService(this.url);

  IOWebSocketChannel? get channel => _channel;
  Function(dynamic data)? listener;
  Function(dynamic error)? onErrors;
  Function? onDones;
  Map<String, dynamic>? headers;

  void connect(
      {Map<String, dynamic>? headers,
      required Function(dynamic data)? listener,
      Function(dynamic error)? onErrors,
      Function? onDones}) {
    _channel = IOWebSocketChannel.connect(Uri.parse(url), headers: headers);
    this.headers = headers;
    this.listener = listener;
    this.onDones = onDones;
    this.onErrors = onErrors;
    _channel!.stream.listen(
      listener,
      onError: (error) {
        // log('WebSocket error: $error');
        if (this.onErrors != null) {
          this.onErrors!(error);
        }
        _handleConnectionError();
      },
      onDone: () {
        // log('WebSocket connection closed.');
        if (this.onDones != null) {
          this.onDones!();
        }
        // _handleConnectionError();
      },
    );

    log('WebSocket connected.');
  }

  void sendMessage(String message) {
    if (_channel != null) {
      _channel!.sink.add(message);
    } else {
      log('Cannot send message: WebSocket is not connected.');
    }
  }

  void _handleConnectionError() {
    if (_isReconnecting) return;

    _isReconnecting = true;
    _retryDelay = 1; // Reset delay on a new reconnection attempt
    _attemptReconnect();
  }

  void _attemptReconnect() {
    Timer(Duration(seconds: _retryDelay), () {
      log('Attempting to reconnect...');

      try {
        connect(
            listener: listener,
            headers: headers,
            onDones: onDones,
            onErrors: onErrors);
        _isReconnecting = false; // Reset reconnection state on success
        _retryDelay = 1; // Reset delay
      } catch (e) {
        log('Reconnection failed: $e');
        _retryDelay =
            (_retryDelay * 2).clamp(1, _maxRetryDelay); // Exponential backoff
        _attemptReconnect();
      }
    });
  }

  void disconnect() {
    _channel?.sink.close();
    log('WebSocket disconnected.');
  }
}

// void main() {
//   final WebSocketService = WebSocketService('wss://example.com/chat');

//   WebSocketService.connect();

//   // Simulate sending a message
//   Future.delayed(Duration(seconds: 5), () {
//     chatWebSocket.sendMessage('Hello, World!');
//   });

//   // Simulate disconnect after 15 seconds
//   Future.delayed(Duration(seconds: 15), () {
//     chatWebSocket.disconnect();
//   });
// }
