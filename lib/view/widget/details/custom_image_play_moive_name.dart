

import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/favorite_controller.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';
import '../../../controller/details_items_controller.dart';
import '../../../link_api.dart';
class CustomImageAndPlayMovieAndName extends GetView<DetailsControllerImp> {
  const CustomImageAndPlayMovieAndName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: CachedNetworkImage(
              imageUrl: '${AppLink.image}/${controller.movieModel!.moiveImage}',
              height: MediaQuery.of(context).size.height/2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: () {

            },
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 80,left: 20),
                  child: Column(
                    children:  [
                      const Icon(
                        Icons.play_circle_outline,
                        color: Colors.yellow,
                        size: 65,
                      ),
                      Text(
                        controller.movieModel!.moiveName!.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
           Positioned(
            right: 0,
              child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GetBuilder<FavoriteControllerImp>(
                    builder: (controllerF)=>MaterialButton(
                        onPressed: (){
                          controller.checkFUserAndAddOrDeleteFavorite();
                        },
                      child:  Icon(controller.isFavoriteActive == true
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
        ],
      );
  }
}
