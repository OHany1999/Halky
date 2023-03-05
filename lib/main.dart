import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:halky/firebase_options.dart';
import 'package:halky/screens/create_account/create_account.dart';
import 'package:halky/screens/home.dart';
import 'package:halky/screens/otp/otp_screen.dart';
import 'package:halky/screens/phone_verification/phone_verification_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: PhoneVerificationScreen.routeName,
      routes: {
        PhoneVerificationScreen.routeName:(context)=>PhoneVerificationScreen(),
        OtpScreen.routeName:(context)=> OtpScreen(),
        HomeScreen.routeName : (context)=>HomeScreen(),
        CreateAccountScreen.routeName : (context)=>CreateAccountScreen(),

      },
    );
  }
}

