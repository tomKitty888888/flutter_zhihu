import 'package:flutter/material.dart';

class AutomaticPage extends StatefulWidget {

  AutomaticPage({Key key}):super(key: key);

  @override
  AutomaticPageState createState() => AutomaticPageState();
}

class AutomaticPageState<T extends AutomaticPage > extends State<T> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
