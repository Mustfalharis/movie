import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/category_controller.dart';
import '../widget/category/list_category_mvoie.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CategoryControllerImp());
    return GetBuilder<CategoryControllerImp>(
      builder: (controller)=>ListView(
        children: [
          buildAppBar(context),
           ListCategoryMovie(),
        ],
      ),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Category'.toUpperCase(),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black45,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      );
  }
}
