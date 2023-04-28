
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.archiveOrders,{
      "usersid":usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}