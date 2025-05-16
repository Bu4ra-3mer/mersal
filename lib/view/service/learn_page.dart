import 'package:flutter/material.dart';
import 'package:mersal/core/colors.dart';

import '../../generated/l10n.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  String selectedCategory = "Me";

  late final Map<String, String> descriptions;

  @override
  void initState() {
    descriptions = {
      "Me":
          S
              .of(context)
              .raiseOneHandnstraightTheSecondFingerAndCloseTheOthersnpoint,
      "Father": S.of(context).tapThumbOnForehead,
      "Mother": S.of(context).tapThumbOnChin,
      "Son": S.of(context).combineSignsForBoyAndBaby,
      "Daughter": S.of(context).combineSignsForGirlAndBaby,
      "Baby": S.of(context).mimicRockingABaby,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signLanguageGuide),
        backgroundColor: yellowBG,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: yellowBG,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab("People"),
                _buildTab("Places"),
                _buildTab("Feeling"),
                _buildTab("Expression"),
                _buildTab("Greeting"),
                _buildTab("Actions"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Card(
                  // color: ,
                  elevation: 10,
                  child: SizedBox(
                    width: 120,
                    child: ListView(
                      children:
                          descriptions.keys.map((category) {
                            return ListTile(
                              title: Text(category),
                              tileColor:
                                  selectedCategory == category
                                      ? redAccent
                                      : null,
                              textColor:
                                  selectedCategory == category
                                      ? Colors.white
                                      : Colors.black,
                              onTap: () {
                                setState(() {
                                  selectedCategory = category;
                                });
                              },
                            );
                          }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.grey.shade300,
                          child: Center(child: Text("GIF Placeholder")),
                        ),
                        SizedBox(height: 20),
                        Text(
                          descriptions[selectedCategory]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                          ),
                          child: Text("Download"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Icon(Icons.circle, size: 20, color: redAccent),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}
