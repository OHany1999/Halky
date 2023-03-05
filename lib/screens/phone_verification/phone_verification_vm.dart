import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:halky/models/phone_model.dart';
import 'package:halky/screens/otp/otp_screen.dart';

class PhoneVerificationViewModel extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  String countryCode = '+20';
  static String? verifyId;


  void sendCode({required String PhoneNum,required BuildContext context}){
    auth.verifyPhoneNumber(
      phoneNumber: '${countryCode + PhoneNum}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken){
        verifyId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
    ).then((value) {
      Navigator.pushNamed(context, OtpScreen.routeName,arguments: PhoneModel(phone: PhoneNum));
    }

    ).catchError((error){
      print('send code error ####:$error');
    });
  }

}