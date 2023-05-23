
import 'package:get/get.dart';
validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not Empty userName".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Empty Email".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "45".tr;
    }
  }

  if (val.isEmpty) {
    return "Not Empty".tr;
  }

  if (val.length < min) {
    return "47".tr;
  }

  if (val.length > max) {
    return "48".tr;
  }
}