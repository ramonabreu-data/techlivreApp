import 'package:flutter/material.dart';
import 'package:techlivre_app/screens/aulaBanco_screeen.dart';
// Certifique-se de que este arquivo está presente no seu projeto.

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void _navigateToAulaBancoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AulaBancoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9E47FF), // Fundo roxo
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Olá !',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
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
            Expanded(
              child: ListView(
                children: [
                  _buildCourseTile(
                    iconData: Icons.storage,
                    title: 'Guia dos Elfos de DB',
                    color: Colors.purple.shade300,
                    onTap: _navigateToAulaBancoScreen,
                  ),
                  _buildCourseTile(
                    iconData: Icons.code,
                    title: 'Jornada Aprendiz de Mago Python',
                    color: Colors.purple.shade300,
                  ),
                  _buildCourseTile(
                    iconData: Icons.computer,
                    title: 'Saga do Guerreiro do reino Java Script',
                    color: Colors.purple.shade300,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.person, color: Colors.white),
                  Icon(Icons.settings, color: Colors.white),
                  Icon(Icons.power_settings_new, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseTile({
    required IconData iconData,
    required String title,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Card(
      color: color,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(iconData, size: 36.0),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: onTap,
      ),
    );
  }
}
