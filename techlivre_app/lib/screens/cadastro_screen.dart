import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_screen.dart'; // Certifique-se de que este arquivo existe no caminho especificado.

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('https://www.techlivre.com/api/users/create.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'cpf': _cpfController.text,
          'action': 'register',
        }),
      );

      if (response.statusCode == 201) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sucesso'),
              content: Text('Usuário criado com sucesso, Volte ao login e faca login!'),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Falha ao criar o usuário. Tente novamente.'),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
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
  }

  @override
  void dispose() {
    // Limpa os controladores quando o Widget for desmontado
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF9E47FF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
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
                    'CADASTRO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: screenWidth * 0.8,
                    child: _buildTextField(
                      controller: _nameController,
                      hint: 'NOME',
                      obscureText: false,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: screenWidth * 0.8,
                    child: _buildTextField(
                      controller: _emailController,
                      hint: 'EMAIL',
                      obscureText: false,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: screenWidth * 0.8,
                    child: _buildTextField(
                      controller: _passwordController,
                      hint: 'SENHA',
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: screenWidth * 0.8,
                    child: _buildTextField(
                      controller: _cpfController,
                      hint: 'CPF',
                      obscureText: false,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton.icon(
                    icon: Icon(Icons.check),
                    label: Text('CADASTRAR'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 214, 86, 236),
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: registerUser,
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    label: Text(
                      'login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required bool obscureText,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo é obrigatório';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 233, 207, 238),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
