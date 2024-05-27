import 'package:api_management/helper/Prefrences.dart';
import 'package:api_management/provider/login_provider.dart';
import 'package:api_management/provider/transaction_provider.dart';
import 'package:api_management/routes/Routes.dart';
import 'package:api_management/screens/Splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceManager.instance.initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => LoginProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        initialRoute: Routes.splashScreen,
        routes: Routes.data,
      ),
    );
  }
}
