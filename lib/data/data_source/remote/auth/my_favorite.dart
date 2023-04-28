
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  postData( String id) async {
    var response = await crud.postData(AppLink.favoriteView, {
      "id" : id,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await crud.postData(AppLink.favoriteDelete, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}