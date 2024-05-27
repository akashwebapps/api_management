import 'package:api_management/components/drawer_component.dart';
import 'package:api_management/helper/Utils.dart';
import 'package:api_management/routes/Routes.dart';
import 'package:flutter/material.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HypeU"),
      ),
      drawer: Drawer(
        child: DrawerLayout(
          onTransactionClick: () {
            Navigator.pop(context);
            Utils.push(context, Routes.cardTransaction);
          },
          onFollowingClick: () {
            Navigator.pop(context);
            Utils.push(context, Routes.following);
          },
        ),
      ),
    );
  }
}
