import 'package:anilmastertest/pages/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:anilmastertest/controller/test_controller.dart';
import 'package:anilmastertest/redux/actions/fetch_action.dart';
import 'package:anilmastertest/redux/store.dart';
import 'homepage/personmodel.dart';
// void main() => runApp(new MainScreen());
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return new MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   routes: <String, WidgetBuilder>{
    //     '/Home':   (BuildContext context) => new  homePage(),
    //     '/favirates':   (BuildContext context) => new  SettingsUI(),
    //     '/Setting':   (BuildContext context) => new  SettingsUI(),
    //   },
    //   home: new BottomNavBar(),
    // );
    return Scaffold(
      body: BottomNavBar(),
    );
  }
}
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  // GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    getData();
    super.initState();
     homePage();
  }

  getData() async {
    var res = await TestController().getData();
    await store.dispatch(FetchTodosAction());
    print("Response data ${store.state.todos}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          // key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30 ),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blue,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: SafeArea(
          child: Container(
              color: Colors.white,
              child:GetPage()
          ),
        ));
  }
  Widget GetPage(){
    switch(_page){
      case 0:
        return homePage();
        break;
      case 1:
        return homePage();
        break;
      case 2:
        return SettingsUI();
        break;
      default:
        return Text('not found page');

    }
  }
}
