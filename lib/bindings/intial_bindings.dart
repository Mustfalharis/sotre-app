import 'package:get/get.dart';
import 'package:store_getx/core/class/crud.dart';
class InitialBindings extends Bindings
{
  @override
  void dependencies() {
   Get.put(Crud());
  }
}