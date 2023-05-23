import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/view/widget/search/without_user_recent_search.dart';
import '../../../controller/serach_controller.dart';
import '../../../link_api.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../custom_empty.dart';
class ListMovieRecentSearch extends GetView<SearchControllerImp> {
  const ListMovieRecentSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
          condition: controller.dataRecentSearches.isNotEmpty,
          builder: (context)=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Recent searches',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              ...List.generate(controller.dataRecentSearches.length, (index) {
                return buildItemRecentSearch(index);
              })
              // end
            ],
          ),
          fallback: (context)=> const CustomEmpty(

            title: 'Your recent searches will show up here',
            iconData: Icons.manage_search,
          ),
    );
    // const WithoutUseRecentSearch();
  }
  Dismissible buildItemRecentSearch(int index) {
    return Dismissible(
          key: Key(controller.dataRecentSearches[index].moiveId.toString()),
          background: Container(
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              size: 30,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            controller.deleteRecentSearches(
                controller.dataRecentSearches[index].moiveId.toString());
          },
          child: InkWell(
            onTap: () {
              controller.gotToDetails(controller.dataRecentSearches[index].moiveId.toString());
              controller.addRecentSearches(controller.addRecentSearches(controller.dataRecentSearches[index].moiveId.toString()));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      child: CachedNetworkImage(
                    imageUrl:
                        '${AppLink.image}/${controller.dataRecentSearches[index].moiveImage}',
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
                          controller.dataRecentSearches[index].moiveName!,
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
                          '${controller.dataRecentSearches[index].moiveCreate},${controller.dataRecentSearches[index].categoryName}',
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
                          'Rating:${controller.dataRecentSearches[index].moiveRating}',
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
