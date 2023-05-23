

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/setting_controller.dart';
import 'package:movies_app/core/constant/routes.dart';
import 'package:movies_app/data/data_source/remote/auth.dart';
import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../core/services/services.dart';
abstract class SingUpController extends GetxController
{
  showPassword();
  singUp();
  goToLogin();
}
class SingUpControllerImp extends SingUpController
{
  late TextEditingController? userNameController;
  late TextEditingController? emailController;
  late TextEditingController? passwordController;
  GlobalKey<FormState> formState= GlobalKey<FormState>();
  late StatusRequest statusRequest = StatusRequest.none;
  AuthData authData=AuthData(Get.find());
  bool isShowPassword = true;
  MyServices myServices=Get.find();

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
  @override
  singUp()async
  {

    var formData=formState.currentState;
    if(formData!.validate())
    {

      statusRequest = StatusRequest.loading;
      update();
      var response = await authData.postDataSingUp(
        userNameController!.text,
        passwordController!.text,
        emailController!.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("id", response['data']['users_id'].toString()) ;
          myServices.sharedPreferences.setString("username", response['data']['users_name']) ;
          myServices.sharedPreferences.setString("email", response['data']['users_email']) ;
          SettingControllerImp settingController=Get.find();
          settingController.changeLoginOrSingUp();
          Get.back();
          Get.snackbar('successfully'.tr, "Sing up successfully".tr,backgroundColor: Colors.green,);
        } else {
          // Get.defaultDialog(title: "Error".tr,middleText: "Phone Number Or Email Already Exists".tr) ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    userNameController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    userNameController!.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

}
