import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'dart:async';
class Notida {
  FlutterLocalNotificationsPlugin fltrNotification;
  void initState(){
    var androidInitilize = new AndroidInitializationSettings('calendar');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }
  Future notificationSelected(String payload) async {}
  Future notificatio(id,tit,cat,sec) async {
    var andr = AndroidNotificationDetails("andi", "Baba", "channelDescription",
        importance: Importance.max);
    var ios = IOSNotificationDetails();
    var genb = NotificationDetails(android: andr, iOS: ios);
    // await fltrNotification.show(0, "Ahaha", "Hmm Bro i got it", genb);
    var dat = DateTime.now().add(Duration(seconds: sec.abs()));
    fltrNotification.schedule(id, tit, cat, dat, genb);

  }

  Future dlt(id)async{

    fltrNotification.cancel(id);

  }

}
