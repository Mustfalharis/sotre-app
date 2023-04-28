class ItemsModel {
  dynamic itemsId;
  dynamic itemsName;
  dynamic itemsNameAr;
  dynamic itemsDesc;
  dynamic itemsDescAr;
  dynamic itemsCount;
  dynamic itemsActive;
  dynamic itemsPrice;
  dynamic itemsDiscount;
  dynamic itemsDate;
  dynamic itemsImage;
  dynamic itemsCat;
  dynamic categoriesId;
  dynamic categoriesName;
  dynamic categoriesNameAr;
  dynamic categoriesImage;
  dynamic itemsFavorite;
  String? itemsPriceAfterDis;
  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsImage = json['items_image'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    itemsFavorite = json['favorite'];
    itemsPriceAfterDis = json['itemsPriceAfterDis'];
  }
}

