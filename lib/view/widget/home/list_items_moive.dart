import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/home_controller.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../../link_api.dart';

class ListItemsMoive extends GetView<HomeControllerImp> {
  const ListItemsMoive({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequestItems,
          widget: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.dataItems.length,
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
              width: 10,
            ),
            itemBuilder: (context, index) {
              return buildItems(index);
            },
          ),
        ),
      ),
    );
  }
  InkWell buildItems(int index) {
    return InkWell(
      onTap: (){
        controller.gotToDetails(controller.dataItems[index]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              child: CachedNetworkImage(
            imageUrl:
                '${AppLink.image}/${controller.dataItems[index].moiveImage}',
            imageBuilder: (context, imageProvider) {
              return Container(
                width: 190,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          )),
          Container(
            width: 180,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              controller.dataItems[index].moiveName!.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ...List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(controller.dataItems[index].moiveRating.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
