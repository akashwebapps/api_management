import 'package:flutter/material.dart';
import '../components/tab_button.dart';
import '../components/toolbar.dart';

// Define the enum
enum ButtonState { followers, following }

class FollowingActivity extends StatefulWidget {
  const FollowingActivity({Key? key}) : super(key: key);

  @override
  State<FollowingActivity> createState() => _FollowingActivityState();
}

class _FollowingActivityState extends State<FollowingActivity> {
  ButtonState selectedButton = ButtonState.followers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            MyToolbar(title: "Following"),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TabButton(
                    isButtonSelected: selectedButton == ButtonState.followers,
                    tabName: "Followers",
                    topLeft: 50,
                    bottomLeft: 50,
                    onTap: () {
                      setState(() {
                        selectedButton = ButtonState.followers;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TabButton(
                    isButtonSelected: selectedButton == ButtonState.following,
                    tabName: "Following",
                    topRight: 50,
                    bottomRight: 50,
                    onTap: () {
                      setState(() {
                        selectedButton = ButtonState.following;
                      });
                    },
                  ),
                ),
              ],
            ),
            // Add the rest of your content here
          ],
        ),
      ),
    );
  }
}
