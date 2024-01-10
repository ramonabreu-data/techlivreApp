import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Livre - Edu',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WelcomeScreen(), // Configuração inicial para mostrar a tela de boas-vindas.
    );
  }
}
