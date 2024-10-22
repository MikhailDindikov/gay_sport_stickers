import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gay_sport_stickers/sg_main/sg_main_screen.dart';
import 'package:gay_sport_stickers/sg_preview/sg_preview_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: 'app_2Gaeh6XaQKVCNsQWcsRjjkCnKJV7iS');
  final sgSP = await SharedPreferences.getInstance();
  final sgShowIntro = sgSP.getBool('sgShowIntro') ?? true;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(SportGaysApp(sgShowIntro: sgShowIntro));
}

class SportGaysApp extends StatelessWidget {
  final bool sgShowIntro;
  const SportGaysApp({super.key, required this.sgShowIntro});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SportGaysApp',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        useMaterial3: true,
      ),
      home: MediaQuery.withNoTextScaling(
        child: sgShowIntro ? const SGPreviewScreen() : const SgMainScreen(),
      ),
    );
  }
}
