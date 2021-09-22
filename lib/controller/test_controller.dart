import 'package:anilmastertest/controller/base_controller.dart';
import 'package:anilmastertest/services/base_client.dart';

//'https://dummyapi.io', '/data/v1/user?limit=100'
class TestController with BaseController {
  dynamic getData() async {
    // showLoader();
    var res = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/todos  ')
        .catchError(handleError);
    if (res == null) return;
    hideLoader();
    print(res);
    return res;
  }

  dynamic login({email, password}) async {
    // // https:reqres.in/api/login //eve.holt@eqres.in cityslicka
    showLoader();
    var res = await BaseClient().post('https://reqres.in', '/api/login', {
      "email": email, //"eve.holt@reqres.in",
      "password": password, //"cityslicka"
    }).catchError(handleError);
    if (res == null) return false;
    hideLoader();
    print(res);
    return res;
  }
}
