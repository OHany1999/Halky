import 'package:flutter/material.dart';
import 'package:halky/screens/otp/otp_vm.dart';
import 'package:halky/screens/phone_verification/phone_verification_vm.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = 'otp';

  void pinPutTheme(){
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    pinPutTheme();
    return ChangeNotifierProvider(
      create: (context)=>OtpViewModel(),
      builder: (context,widget){
        var pro = Provider.of<OtpViewModel>(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Pinput(
                  length: 6,
                  onChanged: (value){
                    pro.code = value;
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    pro.CheckAuth(context);
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
