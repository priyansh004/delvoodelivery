import 'dart:async';

import 'package:delvoodelivery/src/Pages/welcome.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SPlashScreen extends StatefulWidget {
  const SPlashScreen({super.key});

  @override
  State<SPlashScreen> createState() => _SPlashScreenState();
}

class _SPlashScreenState extends State<SPlashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Welcome_page()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: LoadingAnimationWidget.inkDrop(
                color: Color.fromARGB(255, 245, 245, 245), size: 70)));
  }
}
