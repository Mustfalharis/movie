
import 'package:get/get.dart';

import '../services/services.dart';

String checkUser()
{
  MyServices myServices=Get.find();
  if(myServices.sharedPreferences.getString('id')==null)
    {
      return  "0";
    }else {
    return  myServices.sharedPreferences.getString('id').toString();
      }
}
// void saveId(String save){
//
// }
