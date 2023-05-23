import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/details_items_controller.dart';
import 'package:movies_app/controller/favorite_controller.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';
import '../widget/details/bottom_image.dart';
import '../widget/details/custom_dscription.dart';
import '../widget/details/custom_image_play_moive_name.dart';
import '../widget/details/details_lowest_descritoipn.dart';
import '../widget/details/list_actors_in_moive.dart';
import '../widget/details/list_category_moive.dart';

class DetailsItemsScreen extends StatelessWidget {
  const DetailsItemsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailsControllerImp());
    Get.put(FavoriteControllerImp());
    return Scaffold(
      body: GetBuilder<DetailsControllerImp>(
        builder:(controller)=> HandlingDataView(
          statusRequest:controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: const  [
                  CustomImageAndPlayMovieAndName(),
                   BottomImage(title: 'overview'),
                   SizedBox(
                    height: 10,
                  ),
                  ListCategoryInMovie(),
                  SizedBox(
                    height: 5,
                  ),
                  CustomDescription(),
                  SizedBox(
                    height: 5,
                  ),
                  DetailsLowestDescription(),
                  BottomImage(title: 'actors'),
                  SizedBox(
                    height: 5,
                  ),
                  ListActorsInMovie(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
