import 'package:flutter/material.dart';
import 'package:loanapp/utils/constants.dart';
import 'package:loanapp/views/home.dart';
import 'package:loanapp/views/signup.dart';

import '../components/components.dart';
import '../utils/size_config.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = new TextEditingController();

  TextEditingController password2Controller = new TextEditingController();
  FocusNode fn = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: regularText(
              "Welcome to LoanApp", 2.3, Colors.black, FontWeight.bold, 1)),
      body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
          child: ListView(physics: AlwaysScrollableScrollPhysics(), children: [
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    space1(),
                    regularText(
                        "Username", 1.8, Colors.grey, FontWeight.bold, 0),
                    customField(userController, "Username",
                        Icons.account_circle_outlined, TextInputType.text),
                    regularText(
                        "Password", 1.8, Colors.grey, FontWeight.bold, 0),
                    customField(password2Controller, "Password", Icons.key,
                        TextInputType.text),
                    space1(),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () async {
                          FocusScope.of(context).requestFocus(fn);

                          if (_formKey.currentState.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));
                          }
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.heightMultiplier * 1.5),
                            decoration: BoxDecoration(
                              color: Constants.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Constants.primaryColor,
                                width: 1,
                              ),
                            ),
                            child: regularText("Login", 2.3, Colors.white,
                                FontWeight.bold, 1)),
                      ),
                    ),
                    space1(),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            )),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.heightMultiplier * 1.5),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Constants.primaryColor,
                                width: 1,
                              ),
                            ),
                            child: regularText("Signup", 2.3, Colors.black,
                                FontWeight.bold, 1)),
                      ),
                    ),
                  ]),
            )
          ])),
    );
  }
}
