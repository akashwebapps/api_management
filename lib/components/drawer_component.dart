import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {
  DrawerLayout(
      {super.key,
      required this.onTransactionClick,
      required this.onFollowingClick});

  void Function() onTransactionClick;
  void Function() onFollowingClick;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          child: Text("HypeU"),
          decoration: BoxDecoration(color: Colors.black12),
        ),
        ListTile(
          leading: Icon(Icons.card_travel_outlined),
          title: Text("Card Transaction"),
          onTap: onTransactionClick,
        ),
        ListTile(
          leading: Icon(Icons.follow_the_signs_rounded),
          title: Text("Following"),
          onTap: onFollowingClick,
        ),
      ],
    );
  }
}
