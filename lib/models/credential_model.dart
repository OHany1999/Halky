import 'package:firebase_auth/firebase_auth.dart';

class CredentialModel {
  PhoneAuthCredential credential;
  String phone;
  CredentialModel({required this.credential,required this.phone});
}