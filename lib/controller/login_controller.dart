

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/setting_controller.dart';
import 'package:movies_app/core/class/check_user.dart';
import 'package:movies_app/core/constant/routes.dart';
import 'package:movies_app/data/data_source/remote/auth.dart';
import 'package:movies_app/view/screen/home.dart';

import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../core/services/services.dart';
import '../view/screen/Serach_page_screen.dart';
import '../view/screen/category_screen.dart';
import '../view/screen/favorite_screen.dart';
import '../view/screen/settings.dart';
abstract class LoginController extends GetxController
{
  showPassword();
  login();
  goToSingUp();
}
class LoginControllerImp extends LoginController
{
  late TextEditingController? emailController;
  late TextEditingController? passwordController;
  GlobalKey<FormState> formState= GlobalKey<FormState>();
  late StatusRequest statusRequest = StatusRequest.none;
  AuthData authData=AuthData(Get.find());
  SettingControllerImp settingController =Get.find();
  bool isShowPassword = true;
  MyServices myServices=Get.find();
  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
  @override
  login()async
  {
    var formData=formState.currentState;
    if(formData!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();
      var response = await authData.postDataLogin(
        passwordController!.text,
        emailController!.text,
      );
      print("=============================== Controller $response ");
      print(response['status']);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
            myServices.sharedPreferences.setString("id", response['data']['users_id'].toString());
            myServices.sharedPreferences.setString("username", response['data']['users_name']) ;
             myServices.sharedPreferences.setString("email", response['data']['users_email']) ;
             settingController.changeLoginOrSingUp();
           Get.back();
           Get.snackbar('successfully'.tr, "Login successfully".tr,backgroundColor: Colors.green,);
        } else {
          Get.defaultDialog(title: "Error".tr,middleText: "Phone Number Or Email Already Exists".tr) ;
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

    super.onInit();
  }
  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  goToSingUp() {
  Get.offNamed(AppRoute.singUp);
  }

}
