class OrdersModel {
  String? ordersId;
  String? ordersUserid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? orderPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersDatetime;
  String? ordersPaymentmethod;
  String? ordersStatus;
  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    orderPrice = json['order_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
  }

}
