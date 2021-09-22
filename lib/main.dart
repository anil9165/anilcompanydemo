import 'package:anilmastertest/Keys.dart';
import 'package:anilmastertest/Routes.dart';
import 'package:anilmastertest/home_page.dart';
import 'package:anilmastertest/pages/auth_page/log_in_page.dart';
import 'package:anilmastertest/pages/buttomnav.dart';
import 'package:anilmastertest/pages/splash_screen.dart';
import 'package:anilmastertest/redux/app_state.dart';
import 'package:anilmastertest/redux/middleware/fetch_data.dart';
import 'package:anilmastertest/redux/reducers/todo_reducer.dart';
import 'package:anilmastertest/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/route_manager.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: GetMaterialApp(
        navigatorKey: Keys.navKey,
        initialRoute: Routes.slashScreen,
        routes: {
          Routes.homeScreen: (context) {
            return HomePage();
          },
          Routes.mainStreen: (context) {
            return MainScreen();
          },
          Routes.login: (context) {
            return LogInPage();//MyCustomSplashScreen
          },
          Routes.slashScreen: (context) {
            return MyCustomSplashScreen();//MyCustomSplashScreen
          }
        },
      ),
    );
  }
}
