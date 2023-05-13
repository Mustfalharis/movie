
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';
import '../../../controller/details_items_controller.dart';
import '../../../link_api.dart';
class ListActorsInMovie extends GetView<DetailsControllerImp> {
  const ListActorsInMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GetBuilder<DetailsControllerImp>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: (){
                   controller.goToMoviesActor(controller.actorsMovie[index]);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        elevation: 3,
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: '${AppLink.actors}/${controller.actorsMovie[index].actorsImage}',
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.actorsMovie[index].actorsName!,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 5,),
              itemCount: controller.actorsMovie.length
          ),
        ),
      ),
    );
  }
}
