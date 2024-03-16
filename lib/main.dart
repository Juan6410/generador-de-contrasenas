import 'package:flutter/material.dart';
import 'package:app2dllo/widgets/FieldsForm.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: PasswordGeneratorWidget(),
        ),
      ),
    );
  }
}
