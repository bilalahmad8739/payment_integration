import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/screens/listsearch/listsearch.dart';
import 'package:payment_integration/screens/local_notification/local_notification.dart';
import 'package:payment_integration/services/notification_services.dart';

//cmmit for github
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = 'pk_test_51OZqMRSC0FUjMbaFZFCpyLmtsuakUlws7XqsOrm1ZzmQYCPiARl0x0Ir0LjPL0mfv3FD3wtd6FvQkbcdsNkFIqBK00G9IPH6C2';

  await Stripe.instance.applySettings();
  
  NotificationService().initNotification();


  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // var initializationsettingAndroid= AndroidInitializationSettings('app_icon');
  // var intilaizeSettings= InitializationSettings(
  //   android: initializationsettingAndroid
  // );
  // await flutterLocalNotificationsPlugin.initialize(
  //   intilaizeSettings
  // );



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Payment Integratio',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  ListSearch()
      //MyHomePage(title: 'Push',),
    );
  }
}