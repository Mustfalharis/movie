import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/details_items_controller.dart';
import '../../../core/class/hindling_data_view.dart';

class ListCategoryInMovie extends GetView<DetailsControllerImp> {
  const ListCategoryInMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: 30,
        child: GetBuilder<DetailsControllerImp>(
          builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.separated(
                itemCount: controller.categoryMovie.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildCategory(index);
                }),
          ),
        ),
      ),
    );
  }

  Container buildCategory(int index) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Text(
        '${controller.categoryMovie[index].categoryName}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
