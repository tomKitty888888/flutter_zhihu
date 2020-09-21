import 'package:flutter/material.dart';
import '../config/index.dart';
import 'base_automatic_page.dart';

class MembersPage extends AutomaticPage {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends AutomaticPageState<MembersPage> {
  @override
  Widget build(BuildContext context) {
    print('会员页面-build');
    return Container(
      child: Center(
        child: Text(KString.membersPage),
      ),
    );
  }
}
