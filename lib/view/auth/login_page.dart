import 'package:flutter/material.dart';
import 'package:mersal/core/colors.dart';
import 'package:mersal/core/tools.dart';
import 'package:sizer/sizer.dart';

import '../../constants/assets.dart';
import '../../generated/l10n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsureText = true;
  final GlobalKey<FormState> loginForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowBG,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: loginForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                vSpace(10),
                Image.asset(Assets.assetsLogo, width: 50.w),
                vSpace(2),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).pleaseEnterYourEmail;
                    }
                    if (!emailRegExp.hasMatch(value)) {
                      return S.of(context).pleaseEnterValideEmail;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).yourEmail,
                    prefixIcon: Icon(Icons.email, color: redAccent),
                  ),
                ),
                vSpace(2),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).pleaseEnterYourPassword;
                    }
                    if (value.length < 8) {
                      return S.of(context).pleaseEnterLatestChar8;
                    }
                    return null;
                  },
                  obscureText: obsureText,
                  decoration: InputDecoration(
                    hintText: S.of(context).yourPassword,
                    prefixIcon: Icon(Icons.lock, color: redAccent),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obsureText = !obsureText;
                        setState(() {});
                      },
                      icon: Icon(
                        !obsureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                vSpace(2),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgotpass');
                    },
                    child: Text(
                      S.of(context).forgotPassword,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                vSpace(5),
                ElevatedButton(
                  onPressed: () {
                    if (loginForm.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  child: Text(S.of(context).login),
                ),
                vSpace(2),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signUp');
                  },
                  child: Text(S.of(context).signup),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
