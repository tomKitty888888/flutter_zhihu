import 'package:flutter/material.dart';
import '../config/index.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    print('我的页面-build');
    return Container(
      child: Center(
        child: Text(KString.personalPage),
      ),
    );
  }
}
