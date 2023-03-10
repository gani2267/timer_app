import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class NotificationApi{
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationsDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        importance: Importance.max,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        sound: RawResourceAndroidNotificationSound('timer')
      ),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload
  }) async =>
     _notifications.show(
         id,
         title,
         body,
         await _notificationsDetails(),
         payload: payload
     );
}