import 'package:api_management/screens/CardTransactionActivity.dart';
import 'package:api_management/screens/FollowingActivity.dart';
import 'package:api_management/screens/HomeActivity.dart';
import 'package:api_management/screens/LoginActivity.dart';
import 'package:api_management/screens/Splash.dart';

class Routes {
  static String splashScreen = "/splashScreen";
  static String loginScreen = "/authScreen";
  static String homeScreen = "/home";
  static String cardTransaction = "/cardTransaction";
  static String following = "/following";

  static final data = {
    splashScreen: (context) => SplashActivity(),
    loginScreen: (context) => LoginActivity(),
    homeScreen: (context) => HomeActivity(),
    cardTransaction: (context) => CardTransactionActivity(),
    following: (context) => FollowingActivity(),
  };
}
