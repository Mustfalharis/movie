
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/login_controller.dart';
import 'package:movies_app/controller/setting_controller.dart';

import '../../core/class/check_user.dart';
import '../../core/constant/routes.dart';
import '../widget/settings/detail_my_account.dart';
import '../widget/settings/text_setting_language_favorite.dart';
class SettingsScreen extends StatelessWidget {
   const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SettingControllerImp());
    return GetBuilder<SettingControllerImp>(
        builder:(controller)=>SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
          buildAppBar(context),
            checkUser()!='0'?
            const DetailsMyAccount():
            const SizedBox(),
            const SizedBox(height: 30,),
            const TextSettingLanguageAndFavorite(),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'Reach To Us',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: const [
                          Icon(Icons.headphones),
                          SizedBox(width: 8,),
                          Text('Customer Service'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding:const  EdgeInsets.symmetric(vertical: 13),
              onPressed: (){
                controller.loginAndLogOut();
                // Get.offNamed(AppRoute.login);
              } ,
              color: Colors.red,
              child:  checkUser()!='0'?
               const Text('logout'):
               const Text('login'),
            ),

          ],
        ),
      ),
    ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings'.toUpperCase(),
          style: Theme.of(context).textTheme.caption!.copyWith(
            color: Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      );
  }
}
