
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';
class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String userid,String itemsId ) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "userId":userid.toString(),
      "itemsId":itemsId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  removeCart(String userid,String itemsId ) async {
    var response = await crud.postData(AppLink.cartDelete, {
      "userId":userid.toString(),
      "itemsId":itemsId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  getCountCart(String userid,String itemsId ) async {
    var response = await crud.postData(AppLink.cartGetCountItems, {
      "userId":userid.toString(),
      "itemsId":itemsId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  getData(String userid) async {
    var response = await crud.postData(AppLink.viewCartAndTotalCountAndPrice, {
      "userId":userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "couponName":couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}