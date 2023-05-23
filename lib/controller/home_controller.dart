
import 'package:get/get.dart';
import 'package:movies_app/data/data_source/remote/home.dart';
import '../core/class/status_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handing_data_controller.dart';
import '../data/model/category.dart';
import '../data/model/movie.dart';
import 'favorite_controller.dart';
abstract class HomeController extends GetxController
{
  getDataSliderAndCategory();
  changSelectedCategory(int index);
  getDataItems();
  gotToDetails(String id);
}
class HomeControllerImp extends HomeController{
  HomeData? homeData=HomeData(Get.find());
  late StatusRequest statusRequest=StatusRequest.none;
  late StatusRequest statusRequestItems=StatusRequest.none;
  List<MoiveModel> dataSlide=[];
  List<CategoryModel> datCategory=[];
  List<MoiveModel> dataItems=[];
  int selectedCategory=0;
  @override
  getDataSliderAndCategory()async
  {
    statusRequest=StatusRequest.loading;
    update();
    var response = await  homeData!.getData("1");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
   if(StatusRequest.success==statusRequest) {
     if (response['status'] == 'success') {
       List temp = response['data']['itemsSlider'];
       dataSlide.addAll(temp.map((e) => MoiveModel.fromJson(e)));
       List tempTwo = response['data']['category'];
       datCategory.addAll(tempTwo.map((e) => CategoryModel.fromJson(e)));

     }
     else {
       statusRequest = StatusRequest.failure;
     }
     update();
   }
  }
  @override
  changSelectedCategory(int index)
  {
   selectedCategory=index;
   getDataItems();
   update();
  }
  @override
  void onInit() {
    getDataSliderAndCategory();
    getDataItems();
    super.onInit();
  }

  @override
  getDataItems()async {
    dataItems.clear();
    statusRequestItems=StatusRequest.loading;
    update();
    var response = await  homeData!.postDataMovieInCat(selectedCategory.toString());
    print("=============================== Controller $response ");
    statusRequestItems = handlingData(response);
    if(StatusRequest.success==statusRequestItems) {
      if (response['status'] == 'success') {
        List temp = response['data'];
        dataItems.addAll(temp.map((e) => MoiveModel.fromJson(e)));
      }
      else {
        statusRequestItems = StatusRequest.failure;
      }
      update();
    }
  }
  @override
  gotToDetails(String id) {
   Get.toNamed(AppRoute.details,arguments: {
     "movieId":id,
   });
  }
 }


