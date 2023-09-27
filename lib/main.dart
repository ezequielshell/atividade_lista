import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Game {
  final String name;
  final String genre;
  final String imagePath;

  Game({
    required this.name,
    required this.genre,
    required this.imagePath,
  });
}

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onButtonPressed;

  WelcomeScreen({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo ao App de Jogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem-vindo!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onButtonPressed,
              child: Text('Ver Lista de Jogos'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<Game> games = [
    Game(name: 'The Witcher 3', genre: 'RPG', imagePath: 'assets/witcher3.png'),
    Game(
        name: 'Grand Theft Auto V',
        genre: 'Action',
        imagePath: 'assets/gtaV.png'),
    Game(
        name: 'The Legend of Zelda',
        genre: 'Adventure',
        imagePath: 'assets/zelda.png'),

    Game(
        name: 'Assassin\'s Creed Odyssey',
        genre: 'Action',
        imagePath: 'assets/odyssey.png'),
    Game(
        name: 'Red Dead Redemption 2',
        genre: 'Action',
        imagePath: 'assets/red.jpg'),
    Game(name: 'Cyberpunk 2077', genre: 'RPG', imagePath: 'assets/cyber.png'),
    Game(name: 'Dark Souls III', genre: 'Action', imagePath: 'assets/dark.png'),
    // Adicione mais jogos conforme necessário

    // Adicione mais jogos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameListScreen(games: games),
                  ),
                );
              },
            ),
      },
    );
  }
}

class GameListScreen extends StatelessWidget {
  final List<Game> games;

  GameListScreen({required this.games});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Jogos'),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(games[index].imagePath),
            title: Text(games[index].name),
            subtitle: Text(games[index].genre),
            onTap: () {
              // Você pode adicionar ação personalizada quando um item da lista é clicado aqui
            },
          );
        },
      ),
    );
  }
}
