import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';
import '../../controller/movies_actors_controller.dart';
import '../../link_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class MoviesActorsScreen extends StatelessWidget {
  const MoviesActorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesActorsControllerImp controller = Get.put(MoviesActorsControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Movies',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 300,
                child: GetBuilder<MoviesActorsControllerImp>(
                  builder: (controller)=>HandlingDataView(
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
                            controller.gotToDetails(controller.dataMovies[index]);

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
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                  },
                                )),
                                const SizedBox(height: 3,),
                                Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    controller.dataMovies[index].moiveName!
                                        .toUpperCase(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
