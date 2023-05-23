import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/home_screen_controller.dart';
import '../widget/home_screen/custom_bottom_appBar_home_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller)=>Scaffold(
        bottomNavigationBar: const CustomBottomAppBarHomeScreen(),
        body: controller.listPage[controller.currentPage],
      ),
    );
  }
}
