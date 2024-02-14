// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sgold/Widgets/navigation_bar.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sgold/utils/constants/text_strings.dart';
import 'package:sgold/utils/theme/theme.dart';
import 'package:sgold/Models/testing_api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    );
  }
}
