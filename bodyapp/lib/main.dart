import 'package:bodyapp/shared/colors.dart';
import 'package:flutter/material.dart';
import 'medidas/medidas.dart';
// import 'home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BodyApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey,
          disabledColor: Colors.grey,
          selectedColor: AppColors.teal,
          secondarySelectedColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          labelStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
          ),
          secondaryLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          brightness: Brightness.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MedidasScreen(),
    );
  }
}
