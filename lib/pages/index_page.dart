import 'package:flutter/material.dart';
import 'package:flutter_zhihu/pages/find_page.dart';
import 'package:flutter_zhihu/pages/home_page.dart';
import 'package:flutter_zhihu/pages/members_page.dart';
import 'package:flutter_zhihu/pages/msg_page.dart';
import 'package:flutter_zhihu/pages/personal_page.dart';
import 'package:flutter_zhihu/provider/current_index_provider.dart';
import 'package:provider/provider.dart';
import '../config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.featured_play_list),title: Text(KString.homePage)),
    BottomNavigationBarItem(icon: Icon(Icons.person_pin),title: Text(KString.membersPage)),
    BottomNavigationBarItem(icon: Icon(Icons.explore),title: Text(KString.findPage)),
    BottomNavigationBarItem(icon: Icon(Icons.message),title: Text(KString.msgPage)),
    BottomNavigationBarItem(icon: Icon(Icons.person),title: Text(KString.personalPage)),
  ];

  final List<Widget> pages =[
    HomePage(),
    MembersPage(),
    FindPage(),
    MsgPage(),
    PersonalPage()
  ];

  final pageController = PageController();

  int currentIndex = 0;

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: items,
            currentIndex: currentIndex,
            onTap: onTap
        ),
        // body: bodyList[currentIndex],
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: pages,
          physics: NeverScrollableScrollPhysics(), // 禁止滑动
        ));
  }

//  @override
//  Widget build(BuildContext context) {
//    print('index-build');
//    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
//
//    return ChangeNotifierProvider(
//      create: (context) => CurrentIndexProvider(),
//      child: Consumer<CurrentIndexProvider>(
//        builder: (context, val, child) {
//          return Scaffold(
//            body: pages[val.currentIndex],
//            bottomNavigationBar: BottomNavigationBar(
//              type: BottomNavigationBarType.fixed,
//              currentIndex: val.currentIndex,
//              items: items,
//              onTap: (index){
//                val.setCurrentIndex(index);
//              },
//            ),
//          );
//        },
//      ),
//    );
//  }



}
