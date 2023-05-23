

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller/movies_actors_controller.dart';
import '../../../link_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
class CustomImageActor extends GetView<MoviesActorsControllerImp> {
  const CustomImageActor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: CachedNetworkImage(
              imageUrl:
              '${AppLink.actors}/${controller.actorsModel!.actorsImage}',
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              controller.actorsModel!.actorsName!,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
