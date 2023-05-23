
import 'package:movies_app/core/class/crud.dart';
import 'package:movies_app/link_api.dart';
class AuthData{
  Crud card;
  AuthData(this.card);
  postDataLogin(String password ,String email  ) async {
    var response = await card.postData(AppLink.login, {
      "password" : password ,
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
  postDataSingUp(String username ,String password ,String email  ) async {
    var response = await card.postData(AppLink.singUp, {
      "username" : username,
      "password" : password ,
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}

