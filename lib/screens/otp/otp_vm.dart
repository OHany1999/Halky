import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halky/models/credential_model.dart';
import 'package:halky/models/user_model.dart';
import 'package:halky/screens/create_account/create_account.dart';
import 'package:halky/screens/home.dart';
import 'package:halky/shared/FireBase/firebase_utils.dart';

import '../../models/phone_model.dart';
import '../phone_verification/phone_verification_vm.dart';

class OtpViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String code = '';

  void CheckAuth(BuildContext context) async{
    var args = ModalRoute.of(context)!.settings.arguments as PhoneModel;

    final credential = PhoneAuthProvider.credential(verificationId: PhoneVerificationViewModel.verifyId!, smsCode: code);
    try{
      var userId=  await auth.signInWithCredential(credential);
      MyUser? myUser = await DataBaseUtils.readFromFirebase(userId.user!.uid);
      if(myUser != null){
        Navigator.pushNamed(context, HomeScreen.routeName);
      }else{
        Navigator.pushNamed(context, CreateAccountScreen.routeName,arguments: CredentialModel(credential: credential,phone: args.phone));
      }
    }catch(e){
      print(e);
    }

    // var userID = auth.currentUser!.uid;
    // print('userID : $userID');
  }
}
