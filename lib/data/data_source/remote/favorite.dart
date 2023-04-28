
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String userid,String itemsId ) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "userid":userid.toString(),
      "itemsid":itemsId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  removeFavorite(String userid,String itemsId ) async {
    var response = await crud.postData(AppLink.favoriteRemove, {
      "userid":userid.toString(),
      "itemsid":itemsId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}