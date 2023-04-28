
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String password ,String email  ) async {
    var response = await crud.postData(AppLink.login, {
      "password" : password ,
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}