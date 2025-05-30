import 'package:flutter/material.dart';
import 'package:mersal/constants/assets.dart';
import 'package:mersal/core/tools.dart';
import 'package:sizer/sizer.dart';

import '../../generated/l10n.dart';

class TransPage extends StatefulWidget {
  const TransPage({super.key});

  @override
  State<TransPage> createState() => _TransPageState();
}

class _TransPageState extends State<TransPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).transSignLanguage)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.assetsUploadVidoe, width: 30.w),
            vSpace(5),
            ElevatedButton(
              onPressed: () {},
              child: Text(S.of(context).pickAVideo),
            ),
          ],
        ),
      ),
    );
  }
}
