import 'package:delvoodelivery/firebase_options.dart';
import 'package:delvoodelivery/src/login/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:delvoodelivery/src/signup/temp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        //primaryColor: Colors.green,

      ),
      // darkTheme: ThemeData(
      //     brightness: Brightness.dark,
      //         primaryColor: Colors.lightBlueAccent,
      //
      // ),
      themeMode: ThemeMode.system,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return temp();
            } else {
              return loginPage();
            }
          },
        ),
    );
  }
}
