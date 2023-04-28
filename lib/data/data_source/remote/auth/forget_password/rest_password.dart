
import '../../../../../core/class/crud.dart';
import '../../../../../link_api.dart';
class RestPasswordData {
  Crud crud;
  RestPasswordData(this.crud);
  postData(String password ,String email  ) async {
    var response = await crud.postData(AppLink.restPasswordFP, {
      "password" : password,
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}