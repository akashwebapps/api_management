import 'package:api_management/helper/Prefrences.dart';
import 'package:api_management/helper/Utils.dart';
import 'package:api_management/routes/Routes.dart';
import 'package:flutter/material.dart';

class SplashActivity extends StatefulWidget {
  const SplashActivity({super.key});

  @override
  State<SplashActivity> createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Utils.replaceScreenAfter(
          context,
          PreferenceManager.instance.isLoggedin
              ? Routes.homeScreen
              : Routes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
                child: Image.asset(
              "assets/gif/circular_load_10s.gif",
              height: 150,
              width: 150,
            )),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.black,
              child: const Text(
                "Let's get start",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
