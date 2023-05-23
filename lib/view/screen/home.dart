
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/home_controller.dart';
import '../widget/home/custom_app_bar.dart';
import '../widget/home/custom_carouse_slider.dart';
import '../widget/home/custom_list_category.dart';
import '../widget/home/custom_text.dart';
import '../widget/home/list_items_moive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return SingleChildScrollView(
        child: GetBuilder<HomeControllerImp>(
          builder:(controller)=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const CustomAppBar(),
              CustomCarouseSlider(),
              const SizedBox(height: 20,),
              CustomListCategory(),
              const SizedBox(height: 10,),
              const CustomText(),
              ListItemsMoive(),
            ],
          ),
        ),
      );
  }

}
