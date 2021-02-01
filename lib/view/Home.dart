import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return new Container(
      height: height,
      alignment: Alignment.center,
      child: Text("Home"),
    );
  }
}
