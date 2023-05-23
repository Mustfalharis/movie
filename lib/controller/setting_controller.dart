
import 'package:get/get.dart';
import 'package:movies_app/core/class/check_user.dart';
import 'package:movies_app/core/constant/routes.dart';
import 'package:movies_app/core/services/services.dart';

abstract class SettingController extends GetxController
{
  loginAndLogOut();
  changeLoginOrSingUp();
}
class SettingControllerImp extends SettingController
{
   MyServices myServices=Get.find();

   @override
  void onInit() {
    super.onInit();
  }

  @override
  loginAndLogOut() {
    if(checkUser()!='0')
      {
        myServices.sharedPreferences.clear();
        update();

      }
    else{
      Get.toNamed(AppRoute.login);
      }
  }

  @override
  changeLoginOrSingUp() {
    update();
  }

}
