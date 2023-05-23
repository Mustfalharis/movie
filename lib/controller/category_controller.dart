

import 'package:get/get.dart';
import 'package:movies_app/core/constant/routes.dart';
import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../data/data_source/remote/category.dart';
import '../data/data_source/remote/home.dart';
import '../data/model/category.dart';
import '../data/model/movie.dart';
abstract class CategoryController extends GetxController
{
  getDataInCategory();
  changSelectedCategory(int index,String categoryName);
  goToAllMovieCategory();
}
class CategoryControllerImp extends CategoryController
{
  CategoryData? categoryData=CategoryData(Get.find());
  HomeData? homeData=HomeData(Get.find());
  late StatusRequest statusRequest=StatusRequest.none;
  List<CategoryModel> dataCategory=[];
  int selectedCategory=0;
  String? selectedCategoryName;

  @override
  getDataInCategory()async{
    statusRequest=StatusRequest.loading;
    update();
    var response = await  categoryData!.getDataCategory();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest) {
      if (response['status'] == 'success') {
        print('asdfadsf');
        List temp = response['data'];
        dataCategory.addAll(temp.map((e) => CategoryModel.fromJson(e)));
      }
      else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
  @override
  changSelectedCategory(int index,String categoryName) {
    selectedCategory=index;
    selectedCategoryName=categoryName;
    goToAllMovieCategory();
    // update();
  }
  @override
  goToAllMovieCategory()
  {
    Get.toNamed(AppRoute.allMovieCategory,arguments: {
      'category': selectedCategoryName,
      'selectedCategory':selectedCategory,
    });
  }


  @override
  void onInit() {
    getDataInCategory();
    super.onInit();
  }





}
