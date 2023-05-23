
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/controller/all_movie_category_controller.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';

import '../../link_api.dart';
class AllMovieCategoryScreen extends StatelessWidget {
  const AllMovieCategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AllMovieCategoryControllerImp  controller=Get.put(AllMovieCategoryControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          controller.selectedCategoryName!,
          style: Theme.of(context).textTheme.caption!.copyWith(
            color: Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
           icon:const Icon( Icons.arrow_back,color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AllMovieCategoryControllerImp>(
          builder:(controller)=>HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                 ...List.generate(controller.dataMovie.length, (index) {
                   return buildInkWell(controller, index);
                 }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  InkWell buildInkWell(AllMovieCategoryControllerImp controller, int index) {
    return InkWell(
                 onTap: () {
                   controller.gotToDetails(controller.dataMovie[index].toString());
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 8.0),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       ClipRRect(
                           child: CachedNetworkImage(
                             imageUrl:
                             '${AppLink.image}/${controller.dataMovie[index].moiveImage}',
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
                               controller.dataMovie[index].moiveName!,
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
                               '${controller.dataMovie[index].moiveCreate}',
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
                               'Rating:${controller.dataMovie[index].moiveRating}',
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
}
