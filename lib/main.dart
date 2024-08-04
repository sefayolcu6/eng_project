import 'package:eng_project/constant/app_constant.dart';
import 'package:eng_project/constant/localization.dart';
import 'package:eng_project/main_page/main_page_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EngProject());
}

class EngProject extends StatelessWidget {
  const EngProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: Localization.appBarTitle,
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppConstant.darkBlue),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.orange[900]),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.red[900]),
        appBarTheme: AppBarTheme(
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
            centerTitle: true,
            color: Colors.orange[900]),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
