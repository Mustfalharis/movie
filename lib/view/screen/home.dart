
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/home_controller.dart';
import '../widget/home/custom_carouse_slider.dart';
import '../widget/home/custom_list_category.dart';
import '../widget/home/custom_text.dart';
import '../widget/home/list_items_moive.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black45,
        ),
        title: Text(
          'Movies-db'.toUpperCase(),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black45,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 25, top: 5),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<HomeControllerImp>(
          builder:(controller)=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomCarouseSlider(),
              SizedBox(height: 20,),
              CustomListCategory(),
              SizedBox(height: 10,),
              CustomText(),
              ListItemsMoive(),
            ],
          ),
        ),
      ),
    );
  }
}
