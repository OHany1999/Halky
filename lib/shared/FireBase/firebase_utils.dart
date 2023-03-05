import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';

class DataBaseUtils{

  static CollectionReference<MyUser> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection('MyUser')
        .withConverter<MyUser>(
      fromFirestore: (snapshot, options) =>
          MyUser.fromJson(snapshot.data()!),
      toFirestore: (MyUser, options) => MyUser.toJson(),
    );
  }

  // //for create account
  static Future<void> addUsersToFirebase(MyUser myUser){
    return getTaskCollection().doc(myUser.UserUId).set(myUser);
  }

  // // for login
  static Future<MyUser?> readFromFirebase(String id) async{
    DocumentSnapshot<MyUser> userRef = await getTaskCollection().doc(id).get();
    var myData= userRef.data();
    return myData;

  }


}