import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sgold/Widgets/navigation_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hloarmxwfypsacdusxhi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhsb2FybXh3Znlwc2FjZHVzeGhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY1ODA5NDQsImV4cCI6MjAyMjE1Njk0NH0.nFMZaGyj30QHVb0ODh6idME5EXrkQIz8Jb83Sqgn6Ew',
  );
  runApp(const HomeTest());
}

final supabase = Supabase.instance.client;

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navbar(),
    );
  }
}




// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }