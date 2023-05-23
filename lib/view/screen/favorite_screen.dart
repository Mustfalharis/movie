

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/favorite_controller.dart';
import '../widget/favorite/list_item_movie.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Scaffold(
       body: GetBuilder<FavoriteControllerImp>(
        builder: (controller)=> SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppBar(context, controller),
              const SizedBox(height: 30,),
              ListItemMovieFavorite()
            ],
          ),
        ),
      ),
    );
  }
  AppBar buildAppBar(BuildContext context, FavoriteControllerImp controller) {
    return AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
                'favorite',
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
              icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
              ),
            ),
            actions: [
              InkWell(
                onTap: (){
                  controller.allDeleteFavoriteWithDialog();
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 15),
                    child: const Icon(Icons.delete_outline_outlined,color: Colors.black,size: 26,
                    )
                ),
              ),
            ],
            );
  }

}
