import 'package:flutter/material.dart';
import 'package:quizzly/pages/correct_wrong/correct_wrong_home_page.dart';
import 'package:quizzly/pages/home_page/home_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "Quizzly",
      theme: ThemeData(
      useMaterial3: true,
      ),
     home: const HomePage(),
    );
  }
}
