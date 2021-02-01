import 'package:bottom_navigation_getx/controller/bottomController.dart';
import 'package:bottom_navigation_getx/controller/homeController.dart';
import 'package:bottom_navigation_getx/style/style.dart';
import 'package:bottom_navigation_getx/view/Home.dart';
import 'package:bottom_navigation_getx/view/Liked.dart';
import 'package:bottom_navigation_getx/view/News.dart';
import 'package:bottom_navigation_getx/view/Search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Bottom(),
    );
  }
}

class Bottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    final BottomController boController = Get.put(BottomController());
    final OpenController drawer = Get.put(OpenController());

    return new Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Stack(
            children: [
              PageView(
                children: <Widget>[
                  Home(),
                  Search(),
                  Liked(),
                  News(),
                ],
                controller: boController.controller.value,
                pageSnapping: false,
                physics: NeverScrollableScrollPhysics(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: bottomNav(width,boController,drawer),
              ),
            ],
          ),
        ));
  }

  bottomNav(width,boController,drawer){
    return Container(
        height: 70,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            boxShadow: [Style.boxShadow],
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            item(0,Icons.home_outlined,width,boController,drawer),
            item(1,Icons.search,width,boController,drawer),
            item(2,Icons.favorite_outline,width,boController,drawer),
            item(3,Icons.fiber_new_sharp,width,boController,drawer)
          ],
        ));
  }

  navigateToPage(int input,BottomController boController,OpenController drawer) {
    boController.animateTo(input);
    boController.onPageChanged(input);
    if(input == 0){
      drawer.onPageChanged(0);
      drawer.resetController(input);
    }
  }

  item(index,name,width,boController,drawer) {
    return Material(
      color: Colors.white.withOpacity(.5),
      borderRadius: BorderRadius.all(Radius.circular(9)),
      child: InkWell(
        splashColor: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.all(Radius.circular(500)),
        enableFeedback: true,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            width: width*.18,
            height: 50,
            child: Obx(()=>Icon(name, color: index == boController.page.value ? Style.primaryColor : Colors.grey,
                size: index == boController.page.value ?  30 : 25))
        ),
        onTap: (){
          navigateToPage(index,boController,drawer);
        },
      ),
    );
  }

  animateTo(int page,OpenController drawer) {
    drawer.onPageChanged(page);
    drawer.resetController(page);
  }
}
