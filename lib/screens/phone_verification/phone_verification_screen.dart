import 'package:flutter/material.dart';
import 'package:halky/screens/phone_verification/phone_verification_vm.dart';
import 'package:provider/provider.dart';

class PhoneVerificationScreen extends StatelessWidget {
  static const String routeName = 'verification';

  TextEditingController PhoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PhoneVerificationViewModel phoneVerificationViewModel = PhoneVerificationViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => phoneVerificationViewModel,
      builder: (context, widget) {
        var pro = Provider.of<PhoneVerificationViewModel>(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: PhoneNumberController,
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return 'please Enter Phone Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Type',
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){

                      phoneVerificationViewModel.sendCode(PhoneNum: PhoneNumberController.text, context: context);
                    }
                  },
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
