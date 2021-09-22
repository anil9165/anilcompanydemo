import 'dart:convert';

import 'package:anilmastertest/helper/dialog_helper.dart';
import 'package:anilmastertest/services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoader();
    if (error is BadRequestException) {
      var message = jsonDecode(error.message);
      DialogHelper.showErrorDialog(description: message['error'] ?? message);
    } else if (error is UnAuthorizedException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: "Oops! It took longer to respond.");
    } else {
      print("Test${error}");

      DialogHelper.showErrorDialog();
    }
  }

  void showLoader() {
    DialogHelper.showLoader();
  }

  void hideLoader() {
    DialogHelper.hideLoader();
  }
}
