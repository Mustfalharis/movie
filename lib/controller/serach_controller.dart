import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies_app/data/data_source/remote/search.dart';
import 'package:movies_app/data/model/movie.dart';
import '../core/class/check_user.dart';
import '../core/class/status_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handing_data_controller.dart';
abstract class SearchController extends GetxController
{
 search(String value);
 getDataMovie();
 gotToDetails(String id);
 addRecentSearches(String movie);
 getDataRecentSearches();
 deleteRecentSearches(String movie);
}
class SearchControllerImp extends SearchController {
  late TextEditingController? searchController;
  List<MoiveModel> dataSearch=[];
  List<MoiveModel> dataRecentSearches=[];
  late StatusRequest statusRequest = StatusRequest.none;
  SearchData searchData=SearchData(Get.find());
  String userId=checkUser()=='0'?'0':checkUser();
  @override
  search(String value) {
    searchController!.text=value;
    if(searchController!.text.isEmpty)
      {
      getDataRecentSearches();
      }
    else{
      getDataMovie();
    }
  }
  @override
  getDataMovie()async {
    dataSearch.clear();
   statusRequest=StatusRequest.loading;
   update();
   var response = await searchData.getDataSearch(
       searchController!.text,
   );
   print("=============================== Controller $response ");
   statusRequest = handlingData(response);
   if (StatusRequest.success == statusRequest) {
     if (response['status'] == 'success') {
       List temp = response['data'];
       dataSearch.addAll(temp.map((e) => MoiveModel.fromJson(e)));
     }
   }
   update();
  }
  @override
  addRecentSearches(String movie)async{
    var response = await searchData.addRecentSearches(
     userId,
      movie,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print('done');
      }
    }
  }
  @override
  deleteRecentSearches(String movie)async
  {
    var response = await searchData.deleteRecentSearches(
      userId,
      movie,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      dataRecentSearches.removeWhere((element) => element.moiveId==int.parse(movie));
      print(dataSearch.length);
    }
    if(dataRecentSearches.isEmpty)
      {
        getDataRecentSearches();
        update();
      }

  }
  @override
  getDataRecentSearches()async
  {
    dataRecentSearches.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response = await searchData.getDataRecentSearches(
      userId,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List temp = response['data'];
        dataRecentSearches.addAll(temp.map((e) => MoiveModel.fromJson(e)));
      }
    }
    update();
  }
  @override
  void onInit() {
    searchController=TextEditingController();
    getDataRecentSearches();
    super.onInit();
  }
  @override
  void dispose() {
    searchController!.dispose();
    super.dispose();
  }
  @override
  gotToDetails(String id) {
    Get.toNamed(AppRoute.details,arguments: {
      "movieId":id,
    });
  }








}
