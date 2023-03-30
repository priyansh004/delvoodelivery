import 'package:flutter/material.dart';
import 'package:delvoodelivery/src/signup/SignUpPage.dart';
import 'AlreadyHaveAnAccountCheck.dart';
import 'package:delvoodelivery/src/img.dart';
import 'package:delvoodelivery/src/utils/helper.dart';
import 'package:delvoodelivery/src/auth/Firebasefunction.dart';

import 'package:delvoodelivery/src/auth/authFunctions.dart';
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
    child: SafeArea(
      child: Container(
    padding: const EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 30,
    ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            logo(),
              login
                  ? Container()
                  : TextFormField(
                key: ValueKey('fullname'),
                decoration: InputDecoration(
                  hintText: 'Enter Full Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Full Name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    fullname = value!;
                  });
                },
              ),

              // ======== Email ========
              SizedBox(height: 16.0),
              TextFormField(
                key: ValueKey('email'),
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please Enter valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Login button pressed action
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                key: ValueKey('password'),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                ),
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Please Enter Password of min length 6';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Container(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        login
                            ? AuthServices.signinUser(email, password, context)
                            : AuthServices.signupUser(
                            email, password, fullname, context);
                      }
                    },
                    child: Text(login ? 'Login' : 'Signup')),
              ),
              SizedBox(height: 16.0),
              TextButton(
                  onPressed: () {
                    setState(() {
                      login = !login;
                    });
                  },
                  child: Text(login
                      ? "Don't have an account? Signup"
                      : "Already have an account? Login"))

            ],
          ),
        ),
    ),),
    );
  }
}
