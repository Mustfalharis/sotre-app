
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';
class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.pendingOrders,{
      "usersid":usersid.toString(),
        });
    return response.fold((l) => l, (r) => r);
  }
}