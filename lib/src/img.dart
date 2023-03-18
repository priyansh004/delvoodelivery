import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage("assets/images/logo.png");
    Image image =Image(image: assetImage,width: 300,height: 86,);
    return Container(child: image,);
  }
}
