import 'package:flutter/material.dart';
import 'package:mersal/core/colors.dart';
import 'package:mersal/core/tools.dart';

import '../../generated/l10n.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String selectedGendar = 'Male';
  bool isAccepted = false;
  bool obsureText = true;
  final GlobalKey<FormState> loginForm = GlobalKey();

  RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: loginForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (v) {
                  if (v!.isEmpty) {
                    return S.of(context).pleaseEnterYourName;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: S.of(context).enterYourName,
                  prefixIcon: Icon(Icons.person, color: redAccent),
                ),
              ),
              vSpace(3),
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
                  hintText: S.of(context).enterYourEmail,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: yellowAccent),
                  ),
                  prefixIcon: Icon(Icons.email, color: redAccent),
                ),
              ),
              vSpace(3),
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
                  hintText: S.of(context).enterYourPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      obsureText = !obsureText;
                      setState(() {});
                    },
                    icon: Icon(
                      obsureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  prefixIcon: Icon(Icons.lock, color: redAccent),
                ),
              ),
              vSpace(3),
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
                  hintText: S.of(context).confirmPassword,
                  prefixIcon: Icon(Icons.lock, color: redAccent),
                  suffixIcon: IconButton(
                    onPressed: () {
                      obsureText = !obsureText;
                      setState(() {});
                    },
                    icon: Icon(
                      obsureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              vSpace(3),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: 'Male',
                      groupValue: selectedGendar,
                      onChanged: (mohamed) {
                        selectedGendar = mohamed!;
                        setState(() {});
                      },
                      title: Text(S.of(context).male),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: 'Female',
                      groupValue: selectedGendar,
                      onChanged: (beshooo) {
                        selectedGendar = beshooo!;
                        setState(() {});
                      },
                      title: Text(S.of(context).female),
                    ),
                  ),
                ],
              ),
              vSpace(3),
              CheckboxListTile(
                value: isAccepted,
                onChanged: (v) {
                  isAccepted = v!;
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(S.of(context).iAcceptTermsOfUsePrivacyPolicy),
              ),
              vSpace(4),
              ElevatedButton(
                onPressed: () {
                  if (loginForm.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: Text(S.of(context).signup),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
