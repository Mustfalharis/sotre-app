import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';
class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String orderidcart) async {
    var response = await crud.postData(AppLink.detailsOrders,{
      "orderidcart":orderidcart.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}