import 'package:flutter/material.dart';

import '../base_automatic_page.dart';

class TabBPage extends AutomaticPage {

  @override
  _TabBPageState createState() => _TabBPageState();
}

class _TabBPageState extends AutomaticPageState<TabBPage>{


  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('tab-B-build');

    return Container(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 0),
          itemCount: 20,
          itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
              child: ListTile(title: Text("$index")),
            );
          }
      ),
    );
  }

}

//keytool -genkey -v -keystore E:/w/zmu-android/keys/test.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias key