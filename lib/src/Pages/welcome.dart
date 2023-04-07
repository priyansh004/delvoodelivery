import 'dart:io';

import 'package:delvoodelivery/src/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({super.key});

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  List images = ["welcome.jpg", "welcome.jpg"];
  List texts = ["Deliver", "Recieve"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: images.length,
      itemBuilder: (_, index) {
        return Container(
          child: Container(
            margin: EdgeInsets.only(top: 150, left: 20, right: 30),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      texts[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 37,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 10,
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      'Deliver any kind of product they ask for , and get money as you fee ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 27, 26, 26), fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FancyLoginPage();
                        }));
                      },
                      child: Icon(
                        Icons.double_arrow,
                        size: 35,
                      ))
                ],
              )
            ]),
          ),
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/" + images[index]))),
        );
      },
    ));
  }
}
