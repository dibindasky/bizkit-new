import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class PromtController extends GetxController {
  var hasCard = false.obs;
  var hasConnection = false.obs;
  var show = false.obs;
  var message = ''.obs;

  Future<void> closePrompt() async {
    show.value = false;
  }

  Future<void> checkPrompt() async {
    await Future.delayed(const Duration(seconds: 3));
    hasCard.value = await SecureStorage.getHasCard();
    hasConnection.value = await SecureStorage.getHasConnection();

    if (!hasCard.value || !hasConnection.value) {
      show.value = true;
      message.value = !hasCard.value
          ? 'Create your Bizkit Card'
          : 'Create Bizkit Connections';
    } else {
      show.value = false;
    }
  }
}
