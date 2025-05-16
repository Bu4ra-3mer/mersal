import 'package:flutter/material.dart';
import 'package:mersal/constants/assets.dart';
import 'package:mersal/core/colors.dart';
import 'package:mersal/core/tools.dart';

import '../../generated/l10n.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).service)),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          vSpace(10),
          Text(
            S.of(context).ourService,
            style: tstyle(context).headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: redAccent,
            ),
          ),
          vSpace(10),
          ListTile(
            onTap: () {},
            leading: Image.asset(Assets.assetsConvertVideo),
            title: Text(S.of(context).textIntoVideo),
            subtitle: Text(S.of(context).convertAnyTextIntoVideoSignLanguage),
          ),
          vSpace(2),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/learn');
            },
            leading: Image.asset(Assets.assetsLearnLang),
            title: Text(S.of(context).learnSignLanguage),
            subtitle: Text(S.of(context).learnHowToTalkSignLanguage),
          ),
          vSpace(2),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/trans');
            },
            leading: Image.asset(Assets.assetsLangTrans),
            title: Text(S.of(context).translateSignLanguage),
            subtitle: Text(S.of(context).translateSignLanguageByVideoOrImage),
          ),
        ],
      ),
    );
  }
}
