import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/movies_actors_controller.dart';
import '../../../core/class/hindling_data_view.dart';
import '../../../link_api.dart';

class ListMoviesActors extends GetView<MoviesActorsControllerImp> {
  const ListMoviesActors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 300,
      child: GetBuilder<MoviesActorsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.dataMovies.length,
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
              width: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.gotToDetails(
                      controller.dataMovies[index].moiveId.toString());
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          child: CachedNetworkImage(
                        imageUrl:
                            '${AppLink.image}/${controller.dataMovies[index].moiveImage}',
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: 190,
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      )),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 180,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.dataMovies[index].moiveName!.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
