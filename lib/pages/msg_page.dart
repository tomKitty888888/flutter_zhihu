import 'package:flutter/material.dart';
import '../config/index.dart';

class MsgPage extends StatefulWidget {
  @override
  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<MsgPage> {
  @override
  Widget build(BuildContext context) {
    print('消息页面-build');
    return Container(
      child: Center(
        child: Text(KString.msgPage),
      ),
    );
  }
}
