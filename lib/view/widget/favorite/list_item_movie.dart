


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/controller/favorite_controller.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';
import '../../../link_api.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../custom_empty.dart';
class ListItemMovieFavorite extends GetView<FavoriteControllerImp> {
  const ListItemMovieFavorite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: controller.dataFavorite.isNotEmpty,
        builder: (context)=> Column(
          children: [
              ...List.generate(controller.dataFavorite.length, (index) {
                return buildItemMovie(index);
              }),
            ],
          ),
        fallback: (context)=>const CustomEmpty(
          title: 'Favorite is Empty',
          iconData: Icons.favorite_border_outlined,
        ),
    );
  }
  Dismissible buildItemMovie(int index) {
    return Dismissible(
          key: Key(controller.dataFavorite[index].moiveId.toString()),
          background: Container(
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              size: 30,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            controller.getDeleteFavorite(
                controller.dataFavorite[index].moiveId.toString());
              // controller.setFavorite(controller.dataFavorite[index].moiveId, 0);
            },
          child: InkWell(
            onTap: () {
              controller.gotToDetails(controller.dataFavorite[index].moiveId.toString());
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl:
                        '${AppLink.image}/${controller.dataFavorite[index].moiveImage}',
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: 140,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.dataFavorite[index].moiveName!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${controller.dataFavorite[index].moiveCreate},${controller.dataFavorite[index].categoryName}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Rating:${controller.dataFavorite[index].moiveRating}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
