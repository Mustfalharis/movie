
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/singUp_controller.dart';
import 'package:movies_app/core/constant/routes.dart';

import '../../controller/login_controller.dart';
import '../../core/functions/vaild_input.dart';
import '../widget/auth/login/custom_button_auth.dart';
import '../widget/auth/login/custom_text_from_auth.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../widget/auth/login/text_sing_up.dart';
class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SingUpControllerImp controller=Get.put(SingUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            controller.goToLogin();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: Text(
          'SingUp'.toUpperCase(),
          style: Theme.of(context).textTheme.caption!.copyWith(
            color: Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              const SizedBox(height: 50,),
              Image.asset('assets/images/login.png',height: 180,width: 180,),
              const SizedBox(height: 30,),
              CustomTextFromAuth(
                validator: (val)
                {
                  return validInput(val.toString(), 5, 100, "username");
                },
                keyboardType: TextInputType.text,
                hinText: 'Enter Please username'.tr,
                labelText: 'username'.tr,
                iconSuffix: const Icon(Icons.person_outline),
                myController: controller.userNameController!,
              ),
              CustomTextFromAuth(
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  return validInput(val.toString(), 5, 100, "emil");
                },
                hinText: 'Enter Please Email'.tr,
                labelText: 'Email'.tr,
                iconSuffix: const Icon(Icons.email_outlined),
                myController: controller.emailController!,
              ),
              const SizedBox(height: 10,),
              GetBuilder<LoginControllerImp>(
                builder: (context) => CustomTextFromAuth(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    return validInput(val.toString(), 5, 30, "password");
                  },
                  showPassword: false,
                  hinText: 'Enter Please Password'.tr,
                  labelText: 'Password'.tr,
                  myController: controller.passwordController!,
                  iconSuffix: const Icon(Icons.lock_outline,color: Colors.black,),
                ),
              ),
              const SizedBox(height: 10,),
              CustomButtonAuth(
                text: 'SingUp',
                onPressed:(){
                  controller.singUp();
                } ,
              ),
              const SizedBox(height: 5,),
              // CustomTextSingUpOrSingIn(
              //   ontap: (){
              //
              //   },
              //   textOne: 'Don\'t have an Account?',
              //   textTwo: 'Login',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}