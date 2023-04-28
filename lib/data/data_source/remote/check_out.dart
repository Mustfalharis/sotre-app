
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);
  checkOutData(Map data) async {
    var response = await crud.postData(AppLink.checkOut, data);
    return response.fold((l) => l, (r) => r);
  }
}