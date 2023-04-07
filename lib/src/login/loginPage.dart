import 'package:delvoodelivery/src/Home/Home.dart';
import 'package:delvoodelivery/src/utils/loading.dart';
import 'package:flutter/material.dart';
import 'AlreadyHaveAnAccountCheck.dart';
import 'package:delvoodelivery/src/img.dart';
import 'package:delvoodelivery/src/utils/helper.dart';
import 'package:delvoodelivery/src/auth/Firebasefunction.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:delvoodelivery/src/auth/authFunctions.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FancyLoginPage extends StatefulWidget {
  @override
  _FancyLoginPageState createState() => _FancyLoginPageState();
}

class _FancyLoginPageState extends State<FancyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _errorMessage = '';
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        final userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Login successful, navigate to next screen
        //Navigator.pushReplacementNamed(context, LoadingScreen());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoadingScreen()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          setState(() {
            _errorMessage = 'Invalid email or password';
          });
        } else {
          setState(() {
            _errorMessage = 'An error occurred, please try again later';
          });
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue, Colors.blueAccent],
                    ),
                  ),
                ),
                SizedBox(height: 100),
                logo(),
                SizedBox(height: 16),
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  child:
                      _isLoading ? CircularProgressIndicator() : Text('LOGIN'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
