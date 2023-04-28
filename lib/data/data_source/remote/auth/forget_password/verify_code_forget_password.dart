
import '../../../../../core/class/crud.dart';
import '../../../../../link_api.dart';
class VerifyCodeSingFPData {
  Crud crud;
  VerifyCodeSingFPData(this.crud);
  postData(String verifyCode ,String email  ) async {
    var response = await crud.postData(AppLink.verifyCodeFP, {
      "verifycode" : verifyCode,
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}