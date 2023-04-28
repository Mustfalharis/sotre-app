
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import 'package:store_getx/data/data_source/remote/home.dart';

import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../core/services/services.dart';
import '../data/data_source/remote/items.dart';
import '../data/model/categoires_model.dart';
import '../data/model/itmes_model.dart';
abstract class ItemsController extends GetxController
{
   intiData();
   changeCat(int index);
   getItems(String categoryId);
   goToProductDetails(ItemsModel itemsModel);
   checkSearch(String val,String categoryId);
   onSearchItems();
   goToMyFavorite();
   searchData();
}

class ItemsControllerImp extends ItemsController {

  List<CategoriesModel> categories = [];
  int? selectedCat;
  TextEditingController? search;
  bool isSearch=false;
  List<ItemsModel> itemsSearch = [];
  // List<ItemsModel> data = [];
  List data = [];
  ItemsData itemsData = ItemsData(Get.find());
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  @override
  intiData()
  {
   categories=Get.arguments['categories'];
   selectedCat=Get.arguments['selectCat'];
   search=TextEditingController();
  }
  @override
  changeCat(int index) {
    selectedCat=index;
    getItems(selectedCat.toString());
    update();
  }

  @override
  void onInit() {
    intiData();
    getItems(selectedCat.toString());
    super.onInit();
  }

  @override
  getItems(String categoryId)async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
      categoryId,
      myServices.sharedPreferences.getString('id')!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
       data.addAll(response['data']);
          // data.addAll(temp.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  @override
  searchData() async {
    itemsSearch.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> temp  = response['data'];
        itemsSearch.addAll(temp.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails,arguments: {
      "ItemsModel":itemsModel
    });
  }

  @override
  checkSearch(String val,String categoryId)
  {
    if(val.isEmpty)
    {
      isSearch=false;
      searchData();

    }

    update();
  }
  @override
  onSearchItems()async
  {
    isSearch=true;
    update();
  }
  @override
  goToMyFavorite() {
    Get.toNamed(AppRoute.myFavorites);
  }


}
