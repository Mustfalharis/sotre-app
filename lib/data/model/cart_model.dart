class CartModel {
  String? itemsPriceTotil;
  String? countItemsTotil;
  String? cartId;
  String? itmesId;
  String? userId;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsImage;
  String? itemsCat;

  CartModel(
      {this.itemsPriceTotil,
        this.countItemsTotil,
        this.cartId,
        this.itmesId,
        this.userId,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsImage,
        this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsPriceTotil = json['itemsPriceTotil'];
    countItemsTotil = json['countItems'];
    cartId = json['cart_id'];
    itmesId = json['itmesId'];
    userId = json['userId'];
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
  }

}

