import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../helper/Utils.dart';

class MyToolbar extends StatelessWidget {
  MyToolbar({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),
        Transform.rotate(
          angle: 15,
          child: ClipOval(
            child: Container(
              color: Colors.red,
              child: IconButton(
                onPressed: () {
                  Utils.popToBack(context);
                },
                iconSize: 40,
                icon: Icon(Icons.add),
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
