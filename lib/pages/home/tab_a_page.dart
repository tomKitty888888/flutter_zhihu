import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu/config/color.dart';

import '../base_automatic_page.dart';

class TabAPage extends AutomaticPage {

  @override
  _TabAPageState createState() => _TabAPageState();
}

class _TabAPageState extends AutomaticPageState<TabAPage> {


  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('tab-A-build');

    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (BuildContext context,int index){
          return Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },itemCount: 40,),
    );
  }

}