import 'package:contact_diary_app/pages/Add_page.dart';
import 'package:contact_diary_app/pages/Contact_page.dart';
import 'package:contact_diary_app/pages/Edit_Contact_page.dart';
import 'package:contact_diary_app/pages/detail_page.dart';
import 'package:contact_diary_app/pages/splash_screen.dart';
import 'package:contact_diary_app/theme/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: 'Splash_Screen',
            routes: {
              'Contact_page': (context) => const Contact_page(),
              'Add_page': (context) => const Add_page(),
              'detail_page': (context) => const detail_page(),
              'Edit_Contact_page': (context) => const Edit_Contact_page(),
              'Splash_Screen': (context) => const Splash_Screen(),
            },
          )));
}
