

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import 'cutom_buttom_appbar.dart';

class CustomBottomAppBarHomeScreen extends GetView<HomeScreenControllerImp> {
  const CustomBottomAppBarHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller)=>BottomAppBar(
        child: Container(
          height: 60,
          color: Colors.black,
          child: Row(
            children: [
              ...List.generate(controller.bottomAppBar.length, (index) {
                return CustomButtonAppBar(
                  onPressed: (){
                    controller.changePage(index);
                  },
                  iconData: controller.bottomAppBar[index]["icon"],
                  textButton: controller.bottomAppBar[index]['title'],
                  active: controller.currentPage==index?true:false,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
