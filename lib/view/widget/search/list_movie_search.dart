import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controller/serach_controller.dart';
import '../../../core/constant/images_asset.dart';
import '../../../link_api.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:lottie/lottie.dart';
class ListMovieSearch extends GetView<SearchControllerImp> {
  const ListMovieSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: controller.dataSearch.isNotEmpty,
      builder: (context)=> Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 60,
        ),
        const Text(
          'Movies',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        ...List.generate(controller.dataSearch.length, (index) {
          return buildItemSearch(index);
        }),
      ],
    ),
      fallback: (context)=>buildEmptySearch(context),
    );
  }
  InkWell buildItemSearch(int index) {
    return InkWell(
          onTap: () {
            controller.gotToDetails(controller.dataSearch[index].moiveId.toString());
            controller.addRecentSearches(
                controller.dataSearch[index].moiveId.toString());
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    child: CachedNetworkImage(
                  imageUrl:
                      '${AppLink.image}/${controller.dataSearch[index].moiveImage}',
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
                        controller.dataSearch[index].moiveName!,
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
                        '${controller.dataSearch[index].moiveCreate},${controller.dataSearch[index].categoryName}',
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
                        'Rating:${controller.dataSearch[index].moiveRating}',
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
        );
  }
  Padding buildEmptySearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/9),
      child: Center(child:Column(
        children:  [
          Lottie.asset(AppImageAsset.notResult , width: 250 , height: 250),
          const SizedBox(height: 3,),
          const Text(
              'Not Result',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 7,),
          const Text(
            'Try Search Again',
            style: TextStyle(
                fontSize: 15,

            ),
          ),

        ],
      ),),
    );
  }
}
