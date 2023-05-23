

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/controller/category_controller.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';

import '../../../link_api.dart';

class ListCategoryMovie extends GetView<CategoryControllerImp> {
  const ListCategoryMovie({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HandlingDataView(
      statusRequest: controller.statusRequest,
      widget: Container(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: controller.dataCategory.length,
            itemBuilder: (context, index){
              return buildMovie(index);
            }
        ),
      ),
    );
  }
  InkWell buildMovie(int index) {
    return InkWell(
              onTap: (){
                controller.changSelectedCategory(index,controller.dataCategory[index].categoryName!);
              },
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl:
                          '${AppLink.imageCat}/${controller.dataCategory[index].categoryImage}',
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              width: 190,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        )),
                    Positioned(
                      bottom: 5,
                      left: 20,
                      child: Text(
                        controller.dataCategory[index].categoryName.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
  }
}
