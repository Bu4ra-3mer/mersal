import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mersal/constants/assets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../generated/l10n.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.onLocaleChange,
  });
  final Function(Locale) onLocaleChange;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String answer = "";
  CameraController? cameraController;
  CameraImage? cameraImage;
  FlutterTts flutterTts = FlutterTts();

  bool isDetecting = false;
  bool useFrontCamera = false;

  @override
  void initState() {
    super.initState();
  }

  void initCamera() async {
    final cameras = await availableCameras();
    final selectedCamera = cameras.firstWhere(
      (cam) =>
          cam.lensDirection ==
          (useFrontCamera
              ? CameraLensDirection.front
              : CameraLensDirection.back),
    );

    cameraController = CameraController(
      selectedCamera,
      ResolutionPreset.medium,
    );
    await cameraController!.initialize();
    cameraController!.startImageStream((image) {
      if (!isDetecting) {
        isDetecting = true;
        cameraImage = image;
      }
    });

    setState(() {});
  }

  @override
  void dispose() {
    cameraController?.dispose();
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).stopCamera),
          content: Text(S.of(context).thisWillOnlyStopTheCameraPreview),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                cameraController?.dispose();
                cameraController = null;
                setState(() {});
                Navigator.of(context).pop();
                Fluttertoast.showToast(msg: S.of(context).cameraStopped);
              },
              child: Text(S.of(context).confirm),
            ),
          ],
        );
      },
    );
  }

  Future<void> _shareSentence() async {
    if (answer.isEmpty) {
      Fluttertoast.showToast(msg: S.of(context).theresNoSentenceToShare);
      return;
    }
    await Share.share(
      S.of(context).shareDiscoveredSentencenanswer(answer),
      subject: S.of(context).shareWithYourFriends,
    );
  }

  Future<void> _readSentence() async {
    await flutterTts.speak(answer);
  }

  void _clearSentence() {
    setState(() {
      answer = "";
    });
    Fluttertoast.showToast(msg: S.of(context).sentenceCleared);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        title: Text(
          S.of(context).signLanguageTranslator,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      drawer: DrawerWidget(
        toggleTheme: widget.toggleTheme,
        onLocaleChange: widget.onLocaleChange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).startTranslatingSignLanguageUsingCamera,
                style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    cameraController != null &&
                            cameraController!.value.isInitialized
                        ? AspectRatio(
                          aspectRatio: cameraController!.value.aspectRatio,
                          child:
                              useFrontCamera
                                  ? Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(3.14159),
                                    child: CameraPreview(cameraController!),
                                  )
                                  : CameraPreview(cameraController!),
                        )
                        : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.videocam_off,
                                size: 40,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Text(
                                S.of(context).cameraIsNotActive,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
              ),
              SizedBox(height: 2.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber, width: 2),
                ),
                child: Text(
                  answer.isEmpty
                      ? S.of(context).discoveredSentenceWillAppearHere
                      : answer,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 3.h),
              Wrap(
                spacing: 8,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _buildButton(
                    Icons.play_arrow,
                    S.of(context).startCamera,
                    Colors.green,
                    () {
                      initCamera();
                    },
                  ),
                  _buildButton(
                    Icons.stop,
                    S.of(context).stopCamera,
                    Colors.red,
                    () {
                      _showConfirmationDialog();
                    },
                  ),
                  _buildButton(
                    Icons.switch_camera,
                    S.of(context).switchCamera,
                    Colors.blue,
                    () {
                      if (cameraController != null) {
                        cameraController!.dispose();
                        cameraController = null;
                      }
                      useFrontCamera = !useFrontCamera;
                      initCamera();
                    },
                  ),
                  _buildButton(
                    Icons.share,
                    S.of(context).shareSentence,
                    Colors.blue,
                    () {
                      _shareSentence();
                    },
                  ),
                  _buildButton(
                    Icons.volume_up,
                    S.of(context).readAloud,
                    Colors.orange,
                    () {
                      _readSentence();
                    },
                  ),
                  _buildButton(
                    Icons.clear,
                    S.of(context).clearSentence,
                    Colors.grey,
                    () {
                      _clearSentence();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 42.w,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label, style: TextStyle(fontSize: 11.sp)),
        // style: ElevatedButton.styleFrom(
        //   // backgroundColor: color,
        //   padding: EdgeInsets.symmetric(vertical: 12),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(15),
        //   ),
        // ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  final VoidCallback toggleTheme;
  final Function(Locale) onLocaleChange;

  const DrawerWidget({
    super.key,
    required this.toggleTheme,
    required this.onLocaleChange,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Image.asset(Assets.assetsLogo, height: 200),
          ),
          Divider(),
          ListTile(
            title: Text(S.of(context).home),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.redAccent),
          ),
          ListTile(
            title: Text(S.of(context).learn),
            onTap: () {
              Navigator.pushNamed(context, '/learn');
            },
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.redAccent),
          ),
          ListTile(
            title: Text(S.of(context).service),
            onTap: () {
              Navigator.pushNamed(context, '/service');
            },
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.redAccent),
          ),
          ListTile(
            title: Text(S.of(context).languages),
            trailing: DropdownButton(
              hint: Text(S.of(context).english),
              items: [
                DropdownMenuItem(
                  value: 'en',
                  child: Text(S.of(context).english),
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text(S.of(context).arabic),
                ),
              ],
              onChanged: (v) {
                onLocaleChange(Locale(v!));
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text(S.of(context).toggleTheme),
            trailing: Icon(Icons.brightness_6, color: Colors.redAccent),
            onTap: toggleTheme,
          ),
        ],
      ),
    );
  }
}
