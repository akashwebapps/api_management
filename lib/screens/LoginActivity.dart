import 'package:api_management/helper/Prefrences.dart';
import 'package:api_management/helper/Utils.dart';
import 'package:api_management/provider/login_provider.dart';
import 'package:api_management/routes/Routes.dart';
import 'package:api_management/services/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginActivity extends StatefulWidget {
  LoginActivity({Key? key}) : super(key: key);

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final _globalKey = GlobalKey<FormState>();

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  bool isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/png/new_launcher_icon.png',
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/png/new_app_logo.png',
                    width: MediaQuery.of(context).size.width * .3,
                  )
                ],
              )),
          Expanded(
            flex: 3,
            child: Consumer<LoginProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Form(
                    key: _globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: TextFormField(
                            onChanged: (val) => {value.initResponse()},
                            controller: emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter email-ID',
                                hintStyle: TextStyle(color: Colors.grey),
                                labelStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.white.withOpacity(.1),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.red)),
                                filled: true),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter a Email";
                              }
                              if (!_emailRegex.hasMatch(val)) {
                                return "Please enter a valid Email";
                              }
                              if (value.response != null &&
                                  value.response?.success == false &&
                                  value.response?.errors?.isNotEmpty == true) {
                                for (var element in value.response!.errors!) {
                                  if (element.param == 'email') {
                                    return element.msg;
                                  }
                                  break;
                                }
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: TextFormField(
                            onChanged: (val) => {value.initResponse()},
                            controller: passwordController,
                            style: TextStyle(color: Colors.white),
                            obscureText: isPasswordVisible,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(color: Colors.grey),
                                labelStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.white,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                    )),
                                fillColor: Colors.white.withOpacity(.1),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.red)),
                                filled: true),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter a Password";
                              }
                              if (val.length < 6) {
                                return "Please enter a 6 digit Password";
                              }

                              if (value.response != null &&
                                  value.response?.success == false &&
                                  value.response?.errors?.isNotEmpty == true) {
                                for (var element in value.response!.errors!) {
                                  if (element.param == 'password') {
                                    return element.msg;
                                  }
                                  break;
                                }
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors
                                        .transparent; // Color when the button is disabled
                                  }
                                  return Colors.transparent; // Default color
                                }),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    // Adjust the border radius as needed
                                    side: BorderSide(
                                        color: Colors
                                            .white), // Set the color of the outline border
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_globalKey.currentState!.validate()) {
                                  loginButtonClicked(value, context);
                                }
                              },
                              child: value.isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                        )
                      ],
                    ));
              },
            ),
          )
        ],
      ),
    ));
  }

  Future<void> loginButtonClicked(
      LoginProvider provider, BuildContext context) async {
    await provider.loginUser(
        emailController.text, passwordController.text, "firebaseToken");

    Utils.showSnackbar(context, provider.response!.message!);
    if (provider.response?.success == true) {
      PreferenceManager.instance.setLoggedIn(true);
      PreferenceManager.instance.setToken(provider.response?.token ?? '');
      PreferenceManager.instance.setToken(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VycyI6eyJpZCI6IjY0MWJlMGMxODhmNWJkZThlMWIzNTMwNiJ9LCJpYXQiOjE3MTY0NDM0MTV9.Wbk8C49mIMQE4JqDDbcgc0ELHvxm4E2mwOezFhOu3WM');
      Utils.replaceScreenAfter(context, Routes.homeScreen);
    }
  }
}
