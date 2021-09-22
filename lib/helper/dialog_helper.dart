import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show dialog
  static void showErrorDialog(
      {String title = "Error", String? description = "Something went worng"}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Get.textTheme.headline4,
              ),
              Text(
                description ?? "Something went worng",
                style: Get.textTheme.headline6,
              ),
              ElevatedButton(
                  onPressed: () {
                    bool? isOpen = Get.isDialogOpen ?? false;
                    if (isOpen) {
                      Get.back();
                    }
                  },
                  child: Text("Okay"))
            ],
          ),
        ),
      ),
    );
  }

  //show toast

  //show snackbar

  //show loading
  static void showLoader() {
    Get.dialog(
        WillPopScope(
          onWillPop: () => Future.value(false),
          child: Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Center(
                child: Card(
                  color: Colors.blue.withOpacity(.5),
                  elevation: 1,
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ],
                      )),
                ),
              )),
        ),
        barrierColor: Colors.blue.withOpacity(0),
        barrierDismissible: false);
  }

  //hide loading
  static void hideLoader() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
