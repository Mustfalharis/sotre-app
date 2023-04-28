import 'package:get/get.dart';
import 'package:store_getx/data/data_source/remote/auth/my_favorite.dart';
import 'package:store_getx/data/model/Myfavroite.dart';
import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../core/services/services.dart';
abstract class MyFavoriteController extends GetxController
{
 getData();
 deleteFromFavorite(String favroiteid);
}

class MyFavoriteControllerImp extends MyFavoriteController
{
  List<MyFavoriteModel> data = [];
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  @override
  getData()async
  {
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.postData(
      myServices.sharedPreferences.getString('id')!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List temp=response['data'];
        data.addAll(temp.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  deleteFromFavorite(String favroiteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = myFavoriteData.deleteData(favroiteid);
    data.removeWhere((element) => element.favoriteId == favroiteid);
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}