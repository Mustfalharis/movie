
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handing_data_controller.dart';
import '../data/data_source/remote/home.dart';
import '../data/model/category.dart';
import '../data/model/movie.dart';
abstract class AllMovieCategoryController extends GetxController
{
getDataMovie();
gotToDetails(String id);
}
class AllMovieCategoryControllerImp extends AllMovieCategoryController
{
  HomeData? homeData=HomeData(Get.find());
  late StatusRequest statusRequest=StatusRequest.none;
  List<MoiveModel> dataMovie=[];
  String? selectedCategoryName;
  int selectedCategory=0;
  @override
  getDataMovie()async{
    dataMovie.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response = await  homeData!.postDataMovieInCat(selectedCategory.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest) {
      if (response['status'] == 'success') {
        List temp = response['data'];
        dataMovie.addAll(temp.map((e) => MoiveModel.fromJson(e)));
      }
      else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
  @override
  void onInit() {
    selectedCategoryName=Get.arguments['category'];
    selectedCategory=Get.arguments['selectedCategory'];
    getDataMovie();
    super.onInit();
  }
  @override
  gotToDetails(String id) {
      Get.toNamed(AppRoute.details, arguments: {
        "movieId": id,
      });
  }


}
