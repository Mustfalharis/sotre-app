
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx/core/constant/routes.dart';
import 'package:store_getx/data/model/categoires_model.dart';
import '../core/class/status_request.dart';
import '../core/functions/handing_data_controller.dart';
import '../core/services/services.dart';
import '../data/data_source/remote/home.dart';
import '../data/model/itmes_model.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat);
  goToMyFavorite();
  checkSearch(String val);
  searchData();
  goToPageProductDetails(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;
  TextEditingController? search;
  bool isSearch=false;

  HomeData homeData = HomeData(Get.find());

  // List data = [];
  List<CategoriesModel> categories = [];
  List<ItemsModel> items = [];
  List<ItemsModel> itemsSearch = [];
  // List items = [];
  late StatusRequest statusRequest;

  @override
  initialData() {
    lang=myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    search=TextEditingController();
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data']['categories'];
        categories.addAll(data.map((e) =>CategoriesModel.fromJson(e)));
        List dataItems = response['data']['items'];
        items.addAll(dataItems.map((e) =>ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
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
         print(items[0].itemsPriceAfterDis);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  goToItems(categories,selectedCat) {
    Get.toNamed(AppRoute.items, arguments:{
      "categories":categories,
      "selectCat":selectedCat,
    }
    );
  }
  @override
  checkSearch(String val)
  {
    if(val.isEmpty)
      {
        isSearch=false;
        getData();
      }

    update();
  }
  onSearchItems()async
  {
    isSearch=true;
    update();
  }

  @override
  goToMyFavorite() {
   Get.toNamed(AppRoute.myFavorites);
  }

  @override
  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productDetails,
        arguments:{"ItemsModel":itemsModel,}
    );

  }
}
