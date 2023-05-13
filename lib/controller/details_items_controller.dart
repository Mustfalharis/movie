
import 'package:get/get.dart';
import 'package:movies_app/core/constant/routes.dart';
import 'package:movies_app/data/model/movie.dart';

import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../data/data_source/remote/details.dart';
import '../data/model/actors.dart';
import '../data/model/category.dart';

abstract class DetailsController extends GetxController
{
  getDataCategory();
  goToMoviesActor(ActorsModel actorsModel);
}
class DetailsControllerImp extends DetailsController {
  MoiveModel? movieModel;
  DetailsData detailsData=DetailsData(Get.find());
  late StatusRequest statusRequest=StatusRequest.none;
  List<CategoryModel> categoryMovie=[];
  List<ActorsModel> actorsMovie=[];
  @override
  void onInit() {
    movieModel=Get.arguments['movieModel'];
    print(movieModel!.moiveName);
    getDataCategory();
    super.onInit();
  }

  @override
  getDataCategory() async{
    categoryMovie.clear();
    actorsMovie.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response = await  detailsData.getDataCategory(movieModel!.moiveId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest) {
      if (response['status'] == 'success') {
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



}