import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'login_screen.dart'; // Assegure-se de que este arquivo está presente em seu projeto.

class AulaBancoScreen extends StatefulWidget {
  @override
  _AulaBancoScreenState createState() => _AulaBancoScreenState();
}

class _AulaBancoScreenState extends State<AulaBancoScreen> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  late YoutubePlayerController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
      initialVideoId: 'Ofktsne-utM', // ID do vídeo do YouTube
      flags: YoutubePlayerFlags(autoPlay: false),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: '5JbAOWJbgIA', // ID do vídeo do YouTube
      flags: YoutubePlayerFlags(autoPlay: false),
    );
    _controller3 = YoutubePlayerController(
      initialVideoId: 'R2HrwSQ6EPM', // ID do vídeo do YouTube
      flags: YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9E47FF),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar com saudação e notificações
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Olá!',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
            // Barra de pesquisa
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Busca Rápida',
                  prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 171, 139, 177)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Lista de vídeos
            Expanded(
              child: ListView(
                children: [
                  YoutubePlayer(
                    controller: _controller1,
                    showVideoProgressIndicator: true,
                  ),
                  YoutubePlayer(
                    controller: _controller2,
                    showVideoProgressIndicator: true,
                  ),
                  YoutubePlayer(
                    controller: _controller3,
                    showVideoProgressIndicator: true,
                  ),
                ],
              ),
            ),
            // Barra de navegação inferior com botão de logout
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.person, color: Colors.white),
                  Icon(Icons.settings, color: Colors.white),
                  GestureDetector(
                    onTap: () {
                      // Implementação do logout
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Icon(Icons.power_settings_new, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
