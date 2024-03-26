import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final androindChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High importance notification',
    description: 'Imprtance',
    importance: Importance.defaultImportance,
  );
  final localNotification = LinuxFlutterLocalNotificationsPlugin();
}
