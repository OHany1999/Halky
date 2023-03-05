import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halky/models/user_model.dart';
import 'package:halky/screens/home.dart';
import 'package:halky/shared/FireBase/firebase_utils.dart';

import '../../models/credential_model.dart';

class CreateAccountViewModel extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;

void AddAccount({required BuildContext context,required String name,required String age})async{
  var args = ModalRoute.of(context)!.settings.arguments as  CredentialModel;

  try{
    var userId= await auth.signInWithCredential(args.credential);
    MyUser myUser = MyUser(UserUId: userId.user!.uid, name: name, age: age, phoneNumber: args.phone);
    DataBaseUtils.addUsersToFirebase(myUser);
    Navigator.pushNamed(context, HomeScreen.routeName);
  }catch(e){
    print(e);
  }

}
}