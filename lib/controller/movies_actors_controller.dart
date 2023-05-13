import 'package:get/get.dart';
import 'package:movies_app/data/model/movie.dart';
import '../core/class/status_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handing_data_controller.dart';
import '../data/data_source/remote/movies_actors.dart';
import '../data/model/actors.dart';

abstract class MoviesActorsController extends GetxController
{
  getDataMovies();
  gotToDetails(MoiveModel movieModel);
}
class MoviesActorsControllerImp extends MoviesActorsController {
  MoviesActorsData moviesActorsData = MoviesActorsData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  List<MoiveModel> dataMovies = [];
  ActorsModel? actorsModel;

  @override
  void onInit() {
    actorsModel = Get.arguments['ActorsModel'];
    getDataMovies();
    super.onInit();
  }

  @override
  getDataMovies() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await moviesActorsData.getDataMoviesActors(
        actorsModel!.actorsId.toString()
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List temp = response['data'];
        dataMovies.addAll(temp.map((e) => MoiveModel.fromJson(e)));
      }
      else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  gotToDetails(MoiveModel movieModel) {
    Get.toNamed(AppRoute.details, arguments: {
      "movieModel": movieModel,
    });
  }
}
