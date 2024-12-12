import 'dart:async';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionController extends GetxController {
  /// Observable to track the internet connection status.
  RxBool isConnectedToInternet = false.obs;

  /// StreamSubscription to listen to the internet status changes.
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;

  @override
  void onInit() {
    super.onInit();
    _startListening();
  }

  /// Initializes the InternetConnectionChecker listener.
  void _startListening() {
    _connectionSubscription = InternetConnectionChecker().onStatusChange.listen(
      (status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            isConnectedToInternet.value = true;
            Fluttertoast.showToast(
              msg: "You are now back online.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 3,
              fontSize: 12,
              backgroundColor: Get.isDarkMode ? kwhite : kblack,
              textColor: Get.isDarkMode ? kblack : kwhite,
            );

            break;
          case InternetConnectionStatus.disconnected:
            isConnectedToInternet.value = false;
            Fluttertoast.showToast(
              msg: 'You are currently offline. Please check your connection.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 3,
              fontSize: 12,
              backgroundColor: kred,
              textColor: kwhite,
            );
            break;
        }
      },
    );
  }

  /// Dispose of the subscription when the controller is closed.
  @override
  void onClose() {
    _connectionSubscription?.cancel();
    super.onClose();
  }

  /// Method to manually check the internet status.
  Future<void> checkConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    isConnectedToInternet.value = isConnected;
  }
}
