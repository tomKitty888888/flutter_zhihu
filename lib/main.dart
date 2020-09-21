import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zhihu/pages/index_page.dart';
import 'package:flutter_zhihu/provider/current_index_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'dart:io';

import 'config/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  Provider.debugCheckInvalidValueType = null;
  //管理provider
  var currentIndexProvider = CurrentIndexProvider();

  final List<SingleChildWidget> providers = [
    Provider<CurrentIndexProvider>.value(value: currentIndexProvider)
  ];

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(
      MultiProvider(
        providers: providers,
        child: MyApp(),
      )
  ));


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: KColor.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        platform: TargetPlatform.iOS,
      ),
      home: IndexPage(),
    );
  }
}

