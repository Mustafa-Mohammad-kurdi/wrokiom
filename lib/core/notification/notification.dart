import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fcm/flutter_fcm.dart';
import 'package:workiom/core/utils/navigation/Navigation.dart';
import 'package:workiom/core/utils/shared_preferences/SharedPreferencesHelper.dart';
import '../constants/Keys.dart';


class Messaging {
  static String? token;

  static deleteToken(){
    Messaging.token=null;
    FCM.deleteRefreshToken();
  }

  static Future<void> onNotificationReceived(RemoteMessage message) async {
    await Firebase.initializeApp();

    // var notification =FCMNotificationModel.fromJson(message.data);
    // NotificationMiddleware.onRceived(notification);

    print('Handling a message ${message.data}');
  }

  static initFCM()async{
    try{

      await FCM.initializeFCM(
        withLocalNotification: false,
        navigatorKey: Keys.navigatorKey,
        onNotificationReceived: onNotificationReceived,
        onNotificationPressed: (Map<String, dynamic> data) {
          // var notification =FCMNotificationModel.fromJson(data);
          // NotificationMiddleware.forward(notification);
        },
        onTokenChanged: (String? token) {
          if(token != null) {
            Messaging.token = token;
            // if(AppSharedPreferences.hasAccessToken)
             // NotificationCubit().updateFCMToken(Messaging.token);
            // print('FCM token  ' + token);
          }
        },
        // TODO add this icon to android/app/src/main/res/drawable/ic_launcher.png
        icon: 'ic_launcher',
      );

    }catch(e){
      print(e);
    }
  }
}