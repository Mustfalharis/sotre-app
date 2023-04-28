
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
   postData(String username ,String password ,String email ,String phone ) async {
    var response = await crud.postData(AppLink.singUp, {
      "username" : username,
      "password" : password ,
      "email" : email,
      "phone" : phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}