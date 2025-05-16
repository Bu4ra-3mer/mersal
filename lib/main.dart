import 'package:bot_toast/bot_toast.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mersal/config/theme.dart';
import 'package:mersal/core/local_manager.dart';
import 'package:mersal/generated/l10n.dart';
import 'package:mersal/view/auth/forgot_pass_page.dart';
import 'package:mersal/view/auth/login_page.dart';
import 'package:mersal/view/auth/sign_up_page.dart';
import 'package:mersal/view/home/home_page.dart';
import 'package:mersal/view/home/settings_page.dart';
import 'package:mersal/view/service/learn_page.dart';
import 'package:mersal/view/service/service_page.dart';
import 'package:sizer/sizer.dart';

import 'view/onboarding/onboarding_page.dart';
import 'view/service/trans_page.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyAppInitializer());
}

class MyAppInitializer extends StatefulWidget {
  const MyAppInitializer({super.key});

  @override
  State<MyAppInitializer> createState() => _MyAppInitializerState();
}

class _MyAppInitializerState extends State<MyAppInitializer> {
  Locale? _locale;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final savedLocale = await LanguageManager.getSavedLocale();
    setState(() {
      _locale = savedLocale ?? const Locale('en');
      _isLoading = false;
    });
  }

  void _setLocale(Locale locale) async {
    await LanguageManager.saveLocale(locale.languageCode);
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const CircularProgressIndicator();

    return MyApp(locale: _locale!, onLocaleChange: _setLocale);
  }
}

class MyApp extends StatefulWidget {
  final Locale locale;
  final Function(Locale) onLocaleChange;

  const MyApp({super.key, required this.locale, required this.onLocaleChange});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceTyp) {
        return MaterialApp(
          initialRoute: '/',
          theme: lightTheme,
          darkTheme: darkTheme,
          locale: widget.locale,
          localizationsDelegates: const [
            S.delegate, // المولد من ملفات .arb
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          themeMode: _themeMode,
          supportedLocales: [Locale('ar'), Locale('en')],
          builder: BotToastInit(),
          routes: {
            '/': (_) => OnboardingPage(),
            '/home':
                (_) => HomePage(
                  toggleTheme: toggleTheme,
                  onLocaleChange: widget.onLocaleChange,
                ),
            '/settings': (_) => SettingsPage(),
            '/login': (_) => LoginPage(),
            '/signUp': (_) => SignUpPage(),
            '/service': (_) => ServicePage(),
            '/trans': (_) => TransPage(),
            '/learn': (_) => LearnPage(),
            '/forgotpass': (_) => ForgotPassPage(),
          },
        );
      },
    );
  }
}
