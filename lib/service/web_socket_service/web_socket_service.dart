import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ChatWebSocketService {
  final String url;
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  bool _isReconnecting = false;
  int _retryDelay = 1; // Start with 1 second delay
  final int _maxRetryDelay = 32; // Maximum delay in seconds

  ChatWebSocketService(this.url);

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(url));

    _subscription = _channel!.stream.listen(
      (message) {
        // Handle incoming messages
        print('Message received: $message');
      },
      onError: (error) {
        print('WebSocket error: $error');
        _handleConnectionError();
      },
      onDone: () {
        print('WebSocket connection closed.');
        _handleConnectionError();
      },
    );

    print('WebSocket connected.');
  }

  void sendMessage(String message) {
    if (_channel != null) {
      _channel!.sink.add(message);
    } else {
      print('Cannot send message: WebSocket is not connected.');
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
      print('Attempting to reconnect...');

      try {
        connect();
        _isReconnecting = false; // Reset reconnection state on success
        _retryDelay = 1; // Reset delay
      } catch (e) {
        print('Reconnection failed: $e');
        _retryDelay =
            (_retryDelay * 2).clamp(1, _maxRetryDelay); // Exponential backoff
        _attemptReconnect();
      }
    });
  }

  void disconnect() {
    _subscription?.cancel();
    _channel?.sink.close(status.goingAway);
    print('WebSocket disconnected.');
  }
}

// void main() {
//   final chatWebSocketService = ChatWebSocketService('wss://example.com/chat');

//   chatWebSocketService.connect();

//   // Simulate sending a message
//   Future.delayed(Duration(seconds: 5), () {
//     chatWebSocket.sendMessage('Hello, World!');
//   });

//   // Simulate disconnect after 15 seconds
//   Future.delayed(Duration(seconds: 15), () {
//     chatWebSocket.disconnect();
//   });
// }
