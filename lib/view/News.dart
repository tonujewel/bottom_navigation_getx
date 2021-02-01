import 'package:flutter/material.dart';

typedef IntCallback = Function(int num);

class News extends StatelessWidget {

  final IntCallback page;
  News({this.page});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return new Container(
      height: height,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("News")
          ],
        ),
      ),
    );
  }

}