import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:techlivre_app/screens/cadastro_screen.dart';
import 'dart:convert';

import 'package:techlivre_app/screens/start_screen.dart';


// Assegure-se de que este arquivo está presente em seu projeto.
 // Assegure-se de que este arquivo está presente em seu projeto.

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    final response = await http.post(
      Uri.parse('https://www.techlivre.com/api/users/create.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _emailController.text,
        'password': _passwordController.text,
        'action': 'login',
      }),
    );

    if (response.statusCode == 200) {
      // Se o login for bem-sucedido, redirecione para a tela de início.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => StartScreen()),
      );
    } else {
      // Se o login falhar, mostre uma mensagem de erro.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de Login'),
            content: Text('Email ou senha inválida.'),
            actions: [
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9E47FF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              Image.network(
                'https://techlivre.com/img/techlivre-edu.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20.0),
              Text(
                'TECHLIVRE-EDU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 48.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 233, 207, 238),
                        hintText: 'EMAIL',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 233, 207, 238),
                        hintText: 'SENHA',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton.icon(
                      icon: Icon(Icons.arrow_forward),
                      label: Text('ENTRAR'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 87, 7, 124),
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: loginUser,
                    ),
                    TextButton(
                      child: Text(
                        '>  CADASTRE-SE AQUI !  <',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrationScreen()),
                        );
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Recuperar Senha',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        // Implementar funcionalidade de recuperação de senha
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
