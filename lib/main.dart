import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/screens/homescreen.dart';
import 'package:payment_integration/screens/signupscreen/signupscreen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = 'pk_test_51OZqMRSC0FUjMbaFZFCpyLmtsuakUlws7XqsOrm1ZzmQYCPiARl0x0Ir0LjPL0mfv3FD3wtd6FvQkbcdsNkFIqBK00G9IPH6C2';

  await Stripe.instance.applySettings();
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
      home:  HomeScreen(),
    );
  }
}