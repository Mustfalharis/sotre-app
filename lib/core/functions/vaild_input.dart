
import 'package:get/get.dart';
validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "43".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "44".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "45".tr;
    }
  }

  if (val.isEmpty) {
    return "46".tr;
  }

  if (val.length < min) {
    return "47".tr;
  }

  if (val.length > max) {
    return "48".tr;
  }
}