class MyUser{
  String UserUId;
  String name;
  String age;
  String phoneNumber;


  MyUser({required this.UserUId,required this.name,required this.age,required this.phoneNumber});

  Map<String,dynamic> toJson(){
    return {
      'UserUId':UserUId,
      'name':name,
      'age':age,
      'phoneNumber':phoneNumber,
    };
  }

  MyUser.fromJson(Map<String,dynamic>json):this(
    UserUId: json['UserUId'],
    name: json['name'],
    age: json['age'],
    phoneNumber: json['phoneNumber'],
  );

}