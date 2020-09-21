import 'package:flutter/material.dart';
import '../config/index.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    print('发现页面-build');
    return Container(
      child: Center(
        child: Text(KString.findPage),
      ),
    );
  }
}
