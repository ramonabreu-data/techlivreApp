import 'package:flutter/material.dart';
import 'login_screen.dart'; // Certifique-se de que você tem este arquivo em sua estrutura de pastas.

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9E47FF), // Cor de fundo aproximada da imagem
      body: SafeArea(
        child: SingleChildScrollView( // ScrollView para evitar overflow em telas menores
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'TECHLIVRE-EDU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0), // Espaço antes da imagem
                Image.network(
                  'https://techlivre.com/img/techlivre-edu.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 40.0), // Espaço após a imagem
                Text(
                  'Seja Bem-vindo !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Aqui, a jornada pelo mundo da tecnologia é mais do que apenas aprender; é uma aventura emocionante! ✨',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Prepare-se para mergulhar em um universo onde a educação se encontra com a diversão. Em Tech Livre - Edu, transformamos o aprendizado de tecnologia em uma experiência gamificada, cheia de desafios envolventes e recompensas motivadoras. 🏆',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 40.0), // Espaço antes do botão
                ElevatedButton(
                  child: Text('Avançar   ->'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 87, 7, 124), // Cor aproximada do botão na imagem
                    onPrimary: Color.fromARGB(255, 250, 248, 248), // Cor do texto do botão
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
                SizedBox(height: 20.0), // Espaço no final da tela
              ],
            ),
          ),
        ),
      ),
    );
  }
}
