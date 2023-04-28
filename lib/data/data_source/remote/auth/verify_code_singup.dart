
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';
class VerifyCodeSingUP {
  Crud crud;
  VerifyCodeSingUP(this.crud);
  postData(String verifyCode ,String email  ) async {
    var response = await crud.postData(AppLink.verifyCode, {
      "verifycode" : verifyCode,
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
  reSendData(String email)async
  {
    var response = await crud.postData(AppLink.resend, {
      "email" : email,
    });
  }
}