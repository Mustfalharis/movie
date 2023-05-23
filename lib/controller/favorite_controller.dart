

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/class/check_user.dart';
import 'package:movies_app/core/constant/routes.dart';

import '../core/class/status_request.dart';
import '../core/constant/color.dart';
import '../core/functions/handing_data_controller.dart';
import '../data/data_source/remote/favorite.dart';
import '../data/model/movie.dart';
abstract class FavoriteController extends GetxController
{
  getDataFavorite();
  getAddFavorite(String movie);
  getDeleteFavorite(String movie);
  getAllDeleteFavorite();
  allDeleteFavoriteWithDialog();
  gotToDetails(String id);
  setFavorite(id,val);
}
class FavoriteControllerImp extends FavoriteController
{
  List<MoiveModel> dataFavorite=[];
  late StatusRequest statusRequest = StatusRequest.none;
  FavoriteData favoriteData=FavoriteData(Get.find());
  Map isFavorite={};
  String userId=checkUser()=='0'?'0':checkUser();
  @override
  setFavorite(id, val) {
      isFavorite[id] = val;
      update();
  }
  @override
  getDataFavorite()async
  {
    dataFavorite.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response = await favoriteData.getDataFavorite(
        userId
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List temp = response['data'];
        dataFavorite.addAll(temp.map((e) => MoiveModel.fromJson(e)));
      }
    }
    update();
  }
  @override
  getAddFavorite(String  movie)async
  {
    statusRequest=StatusRequest.loading;
    update();
    var response = await favoriteData.getAddFavorite(
      userId,
        movie,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      }
    }
    update();
  }
  @override
  getAllDeleteFavorite()async
  {
    statusRequest=StatusRequest.loading;
    update();
    var response = await favoriteData.getAllDeleteFavorite(
      userId,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getDataFavorite();
      }
    }
  }
  @override
  allDeleteFavoriteWithDialog()
  {
    if(dataFavorite.isNotEmpty) {
      Get.defaultDialog(
        title: 'Clean favorite',
        titleStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        middleText: 'Are you sure you All Favorites',
        middleTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: 'No',
        cancelTextColor: Colors.white,
        textConfirm: 'Yes',
        confirmTextColor: Colors.white,
        onCancel: () {

        },
        onConfirm: () {
          getAllDeleteFavorite();
          Get.back();
        },
        buttonColor: Colors.black,
      );
    }
    else {
      Get.rawSnackbar(
          backgroundColor: AppColor.green,
          title: "favorite",
          messageText: const Text("No Movie in Favorite"));
    }
  }
  @override
  getDeleteFavorite(String movie)async
  {
    var response = await favoriteData.getDeleteFavorite(
      userId,
      movie,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {

      }
      dataFavorite.removeWhere((element) => element.moiveId==int.parse(movie));

    }
    if(dataFavorite.isEmpty) {
      getDataFavorite();
      update();
    }
  }
  @override
  void onInit() {
    getDataFavorite();
    super.onInit();
  }


  @override
  gotToDetails(String id) {
    Get.toNamed(AppRoute.details, arguments: {
      "movieId": id,
    });
  }









}
