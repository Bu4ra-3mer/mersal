import 'package:flutter/material.dart';
import 'package:mersal/core/tools.dart';

import '../../generated/l10n.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).forgotPassword)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (v) {
                if (v!.isEmpty) {
                  return S.of(context).enterYourEmail;
                }
                if (emailRegExp.hasMatch(v)) {
                  return S.of(context).enterValideEma9il;
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: S.of(context).enterYourEmail,
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          vSpace(2),
          ElevatedButton(
            onPressed: () {},
            child: Text(S.of(context).sendResetLink),
          ),
        ],
      ),
    );
  }
}
