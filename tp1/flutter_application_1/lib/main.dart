import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clash of Clans Media',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 235, 220),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> _characters = [];
  final List<String> _likedCharacters = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    final String response =
        await rootBundle.loadString('assets/coc_characters.json');
    final data = json.decode(response);
    setState(() {
      _characters = data['characters'];
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clash of Clans Media',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoSlab',
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 213, 154, 14),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Troupes'),
            Tab(icon: Icon(Icons.favorite), text: 'Caractères Likés'),
            Tab(icon: Icon(Icons.info), text: 'À propos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildHomePage(),
          _buildLikedPage(),
          _buildAboutPage(),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    if (_characters.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final families = _characters.map((c) => c['family']).toSet().toList();

    return ListView(
      children: families.map((family) {
        final familyCharacters =
            _characters.where((c) => c['family'] == family).toList();

        return ExpansionTile(
          title: Text(family,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          children: familyCharacters
              .map((character) => _buildCharacterCard(character))
              .toList(),
        );
      }).toList(),
    );
  }

  Widget _buildCharacterCard(dynamic character) {
    final isLiked = _likedCharacters.contains(character['name']);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/${character['image']}',
              width: 100,
              height: 100,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Santé : ${character['health']}'),
                  Text(
                      'Dégâts par seconde : ${character['damage_per_second']}'),
                  Text('Temps de formation : ${character['training_time']}'),
                  const SizedBox(height: 8),
                  Text('Capacité spéciale : ${character['special_ability']}',
                      style: const TextStyle(fontStyle: FontStyle.italic)),
                  const SizedBox(height: 8),
                  Text('Description : ${character['description']}',
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  if (isLiked) {
                    _likedCharacters.remove(character['name']);
                  } else {
                    _likedCharacters.add(character['name']);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLikedPage() {
    final liked =
        _characters.where((c) => _likedCharacters.contains(c['name'])).toList();

    return liked.isEmpty
        ? const Center(child: Text('Aucun caractère liké pour le moment.'))
        : ListView(
            children: liked.map((c) => _buildCharacterCard(c)).toList(),
          );
  }

  Widget _buildAboutPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Cette application vous permet de découvrir les différentes troupes de Clash of Clans et de liker vos préférées !',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'À propos de Clash of Clans :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Clash of Clans est un jeu de stratégie en ligne multijoueur où les joueurs construisent leur village, forment des armées et attaquent d’autres joueurs pour récolter des ressources. Développé par Supercell, le jeu combine des éléments de gestion et de combat.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text('Descriptions des types de troupes :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('• Héros : Les héros sont les troupes les plus puissantes.'),
            Text(
                '• Troupes basiques : Les troupes de base utilisées pour les attaques courantes.'),
            Text(
                '• Troupes noires : Des troupes spéciales formées avec l’élixir noir.'),
            Text(
                '• Engins de siège : Permettent de transporter les troupes directement au cœur du village ennemi.'),
          ],
        ),
      ),
    );
  }
}
