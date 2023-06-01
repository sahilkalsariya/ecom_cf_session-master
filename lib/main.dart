import 'package:ecom_cf_session/views/page1.dart';
import 'package:ecom_cf_session/views/page2.dart';
import 'package:ecom_cf_session/views/screens-home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'page1': (context) => const Page1(),
        'page2': (context) => const Page2(),
      },
    );
  }
}
