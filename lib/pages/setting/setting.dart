import 'package:anilmastertest/Keys.dart';
import 'package:anilmastertest/color_constant.dart';
import 'package:anilmastertest/pages/auth_page/log_in_page.dart';
import 'package:anilmastertest/pages/homepage/personmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // debugShowCheckedModeBanner: false,
      body:Setting(title: 'Anildemo',),
    );
  }
}

class Setting extends StatefulWidget {
  Setting({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }
  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isNotEmpty ? subtitle : 'Not set'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
        icon: Icon(
        Icons.arrow_back,
        color: Colors.orangeAccent,
        ),
        onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>homePage()));
    },
        ),
        centerTitle: true,
        title: Text(
          "Setting",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 30, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child:Column(
            children: [
              SizedBox(
                height: 5,
              ),
              buildAccountOptionRow(context, "Logout"),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.orangeAccent,
              ),
              _infoTile('App name', _packageInfo.appName),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.orangeAccent,
              ),
              _infoTile('Package name', _packageInfo.packageName),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.orangeAccent,
              ),
              _infoTile('App version', _packageInfo.version),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.orangeAccent,
              ),
              _infoTile('Build number', _packageInfo.buildNumber),
              ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // Keys.navKey.currentState.
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) =>LogInPage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}