
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/favorite_controller.dart';
import 'package:movies_app/core/constant/routes.dart';
import 'package:movies_app/data/model/movie.dart';

import '../core/class/check_user.dart';
import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../data/data_source/remote/details.dart';
import '../data/model/actors.dart';
import '../data/model/category.dart';

abstract class DetailsController extends GetxController
{
  getDataCategory();
  goToMoviesActor(ActorsModel actorsModel);
  changeFavoriteActive();
  checkFUserAndAddOrDeleteFavorite();

}
class DetailsControllerImp extends DetailsController {
  MoiveModel? movieModel;
  late String movieId;
  DetailsData detailsData=DetailsData(Get.find());
  FavoriteControllerImp controllerF= Get.put(FavoriteControllerImp());
  late StatusRequest statusRequest=StatusRequest.none;
  List<CategoryModel> categoryMovie=[];
  List<ActorsModel> actorsMovie=[];
  bool? isFavoriteActive;
  String userId=checkUser()=='0'?'0':checkUser();

  @override
  void onInit(){
    movieId= Get.arguments['movieId'];
     getDataCategory();
    super.onInit();
  }
  @override
  changeFavoriteActive() {
    isFavoriteActive=!isFavoriteActive!;
    print(isFavoriteActive);
    update();
  }

  @override
  getDataCategory() async{
    categoryMovie.clear();
    actorsMovie.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response = await  detailsData.getDataCategory(
        movieId,
        userId
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest) {
      if (response['status'] == 'success') {
           movieModel=MoiveModel.fromJson(response['data']['movie']);
           isFavoriteActive=movieModel!.favorite==1?true:false;
        List temp = response['data']['category'];
        categoryMovie.addAll(temp.map((e) => CategoryModel.fromJson(e)));
        List tempOne = response['data']['actors'];
        actorsMovie.addAll(tempOne.map((e) => ActorsModel.fromJson(e)));

      }
      else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }

  }

  @override
  goToMoviesActor(ActorsModel actorsModel) {
   Get.toNamed(AppRoute.moviesActors,arguments: {
   'ActorsModel':actorsModel,
   });
  }
  @override
  checkFUserAndAddOrDeleteFavorite() {
    if(checkUser()!="0") {
      if (isFavoriteActive == true) {
        controllerF.getDeleteFavorite(movieModel!.moiveId.toString());
      }
      else {
        controllerF.getAddFavorite(movieModel!.moiveId.toString());
      }
      changeFavoriteActive();
    }
    else
      {
        Get.snackbar(''.tr, "please login first to use this functionadlity".tr,backgroundColor: Colors.red,);
      }
  }






}