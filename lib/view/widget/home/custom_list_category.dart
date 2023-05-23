
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/home_controller.dart';

import '../../../core/constant/color.dart';
class CustomListCategory extends GetView<HomeControllerImp> {
  const CustomListCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          scrollDirection: Axis.horizontal,
          itemCount: controller.datCategory.length,
          itemBuilder: (context,index)
          {

            return customContainerList(index);
          }
      ),
    );
  }

  InkWell customContainerList(int index) {
    return InkWell(
      onTap: (){
        controller.changSelectedCategory(index);
      },
      child: GetBuilder<HomeControllerImp>(
        builder: (controller)=>Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color:controller.selectedCategory==index?Colors.black54:null ,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(20,),
                ),
                child: Text(
                  controller.datCategory[index].categoryName!,
                  style: TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    color: controller.selectedCategory==index?Colors.white:Colors.black45
                  ),
                ),
              ),
      ),
    );
  }
}
