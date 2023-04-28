import 'dart:io';
import 'package:internet_connection_checker/internet_connection_checker.dart';
checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      return true;
  }
    return false;
}
