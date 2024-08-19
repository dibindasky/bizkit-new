import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class MessageCountController extends GetxController {
  late IOWebSocketChannel channel;
  String _error = '';

  void connectChannel({required String? taskId}) async {
    try {
      final token = await SecureStorage.getToken();
      final accessToken = token.accessToken ?? '';

      channel = IOWebSocketChannel.connect(
        Uri.parse(
            SocketEndpoints.taskChat.replaceFirst('{task_id}', taskId ?? '')),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      channel.stream.listen(
        (data) {

        },
        onError: (error) {
          print('Connection error: $error');
          _error = 'Connection error: $error';
        },
        onDone: () {
          if (channel.closeCode != null) {
            print('Connection closed with code: ${channel.closeCode}');
            _error = 'Connection closed with code: ${channel.closeCode}';
          }
        },
      );
    } catch (e) {
      print('Failed to connect: $e');
      _error = 'Failed to connect: $e';
    }
  }
    void closeConnetion() {
    try {
      channel.sink.close();
      // channel.sink.close(status.goingAway);
    } catch (e) {
      print('Channel close error =>$e');
    }
  }
  //   void sendTextMessage() {
  //   if (controller.text.isNotEmpty) {
  //     final message = controller.text;
  //     try {
  //       channel.sink
  //           .add(jsonEncode({"message_type": "text", "message": message}));
  //       controller.clear();
  //       firstLoad = false;
  //     } catch (e) {
  //       print('Failed to send message: $e');
  //       _error = 'Failed to send message: $e';
  //     }
  //   }
  // }
}
