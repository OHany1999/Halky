import 'package:flutter/material.dart';
import 'package:halky/screens/create_account/create_account_vm.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatelessWidget {
  static const String routeName = 'create_account';

  TextEditingController AgeController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreateAccountViewModel createAccountViewModel = CreateAccountViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => createAccountViewModel,
      builder: (context, widget) {
        var pro = Provider.of<CreateAccountViewModel>(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: NameController,
                      validator: (text){
                        if(text == null || text.isEmpty){
                          return 'please Enter Name';
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: AgeController,
                      validator: (text){
                        if(text == null || text.isEmpty){
                          return 'please Enter your age';
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
                ],),

              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      createAccountViewModel.AddAccount(context: context, name: NameController.text, age: AgeController.text);
                    }
                  },
                  child: Text('Enter'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
