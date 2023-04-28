class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNamaAr;
  String? categoriesImage;
  String? categoriesDatetime;
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNamaAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }
}