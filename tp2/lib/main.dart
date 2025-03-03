import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Categorie());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("tp2_taquin"), backgroundColor: Colors.blue),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.network(
                'https://picsum.photos/512/512',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SliderExample(),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderPrimaryValue = 0.2;
  double _currentSliderSecondaryValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          value: _currentSliderPrimaryValue,
          secondaryTrackValue: _currentSliderSecondaryValue,
          label: _currentSliderPrimaryValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderPrimaryValue = value;
              Text('oui');
            });
          },
        ),
        Slider(
          value: _currentSliderSecondaryValue,
          label: _currentSliderSecondaryValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderSecondaryValue = value;
            });
          },
        ),
        Slider(
          value: _currentSliderSecondaryValue,
          label: _currentSliderSecondaryValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderSecondaryValue = value;
            });
          },
        ),
      ],
    );
  }
}

//  EXO 3

class Categorie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "AMSE : TP2 - Antoine Gueudet | Paul Lachaise",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Choisissez un exercice",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ),
              for (int j = 1; j < 8; j++)
                ListTile(
                  title: TextButton(
                    onPressed: () {
                      if (j == 1)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AfficherUneImage(),
                          ),
                        );

                      if (j == 2)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransformerUneImage(),
                          ),
                        );

                      if (j == 3)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuEtNavigation(),
                          ),
                        );

                      if (j == 4)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Tuile(),
                          ),
                        );

                      if (j == 5)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Plateau(),
                          ),
                        );

                      if (j == 7)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Taquin(),
                          ),
                        );
                    },
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      backgroundColor: Colors.blueAccent.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(color: Colors.blueAccent, width: 1.5),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text(
                          "Exercice ${j}",
                          style: TextStyle(color: Colors.blueGrey[800]),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}

//  EXO 1

class AfficherUneImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Afficher une image")),
      body: Center(
        child: Image.network(
          'https://picsum.photos/512/1024',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//  EXO 2

class TransformerUneImage extends StatefulWidget {
  @override
  _TransformerUneImageState createState() => _TransformerUneImageState();
}

class _TransformerUneImageState extends State<TransformerUneImage> {
  double _rotationAngleX = 0.0;
  double _rotationAngleY = 0.0;
  double _scaleFactor = 1.0;
  bool _isMirrored = false;

  final String imageUrl = 'https://picsum.photos/512/1024';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transformer une image")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateX(_rotationAngleX)
                    ..rotateY(_rotationAngleY)
                    ..scale(_isMirrored ? -_scaleFactor : _scaleFactor,
                        _scaleFactor),
                  alignment: Alignment.center,
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Text(
                      "Rotation X: ${(_rotationAngleX * 180 / 3.14159).toStringAsFixed(1)}°",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Slider(
                      value: _rotationAngleX,
                      min: 0.0,
                      max: 3.14159,
                      onChanged: (value) {
                        setState(() {
                          _rotationAngleX = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Text(
                      "Rotation Y: ${(_rotationAngleY * 180 / 3.14159).toStringAsFixed(1)}°",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Slider(
                      value: _rotationAngleY,
                      min: 0.0,
                      max: 3.14159,
                      onChanged: (value) {
                        setState(() {
                          _rotationAngleY = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Text("Échelle: ${_scaleFactor.toStringAsFixed(1)}x",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Slider(
                      value: _scaleFactor,
                      min: 0.5,
                      max: 2.0,
                      onChanged: (value) {
                        setState(() {
                          _scaleFactor = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Text("Effet miroir",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Switch(
                      value: _isMirrored,
                      onChanged: (value) {
                        setState(() {
                          _isMirrored = value;
                        });
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

//  EXO 3 suite

class MenuEtNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu et Navigation"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Exercice réalisé\nsur la page précédente",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 2,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Retour", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  EXO 4

class Tuile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Affichage d'une tuile de l'image"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(children: [
              ClipRect(
                child: Align(
                  alignment: Alignment(0, 0),
                  heightFactor: 0.4,
                  widthFactor: 0.4,
                  child: Image.network(
                    'https://picsum.photos/512/512',
                  ),
                ),
              ),
              ClipRect(
                child: Align(
                  alignment: Alignment(0.5, 0),
                  heightFactor: 0.1,
                  widthFactor: 0.1,
                  child: Image.network(
                    'https://picsum.photos/512/512',
                  ),
                ),
              ),
              Image.network(
                'https://picsum.photos/512/512',
              ),
            ]),
          ),
        ));
  }
}

//  EXO 5

class Plateau extends StatefulWidget {
  @override
  _PlateauState createState() => _PlateauState();
}

class _PlateauState extends State<Plateau> {
  int gridSize = 3;
  final String imageUrl = 'https://picsum.photos/512/512';
  late Image image;

  @override
  void initState() {
    super.initState();
    image = Image.network(imageUrl, fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Plateau de tuiles")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Taille du plateau : $gridSize x $gridSize"),
                Slider(
                  value: gridSize.toDouble(),
                  min: 2,
                  max: 10,
                  divisions: 8,
                  label: "$gridSize",
                  onChanged: (value) {
                    setState(() {
                      gridSize = value.toInt();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<Image>(
              future: _loadImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridSize,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: gridSize * gridSize,
                    itemBuilder: (context, index) {
                      int row = index ~/ gridSize;
                      int col = index % gridSize;

                      return ClipRect(
                        child: Align(
                          alignment: Alignment(
                            -1.0 + (2 * col / (gridSize - 1)),
                            -1.0 + (2 * row / (gridSize - 1)),
                          ),
                          widthFactor: 1 / gridSize,
                          heightFactor: 1 / gridSize,
                          child: snapshot.data,
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<Image> _loadImage() async {
    return image;
  }
}

//  EXO 7 Taquin

class Taquin extends StatefulWidget {
  @override
  _TaquinState createState() => _TaquinState();
}

class _TaquinState extends State<Taquin> {
  List<List<int>> _plateau = []; //problème, a changer
  int _taille = 3;
  int _compteurDeplacements = 0;
  int _tailleTuile = 0; //problème, a changer
  int _emptyTileX = 0; //problème, a changer
  int _emptyTileY = 0; //problème, a changer

  @override
  void initState() {
    super.initState();
    _tailleTuile = 100;
    _initialiserPlateau();
  }

  void _initialiserPlateau() {
    _plateau = List.generate(
        _taille, (i) => List.generate(_taille, (j) => i * _taille + j));
    _emptyTileX = _taille - 1;
    _emptyTileY = _taille - 1;
    _plateau[_emptyTileX][_emptyTileY] = -1;
  }

  void _melangerPlateau(int deplacements) {
    Random random = Random();
    for (int i = 0; i < deplacements; i++) {
      List<int> deplacementsPossibles = _getDeplacementsPossibles();
      int deplacement =
          deplacementsPossibles[random.nextInt(deplacementsPossibles.length)];
      _deplacerTuile(deplacement);
    }
  }

  List<int> _getDeplacementsPossibles() {
    List<int> deplacements = [];
    if (_emptyTileX > 0) deplacements.add(0);
    if (_emptyTileX < _taille - 1) deplacements.add(1);
    if (_emptyTileY > 0) deplacements.add(2);
    if (_emptyTileY < _taille - 1) deplacements.add(3);
    return deplacements;
  }

  void _deplacerTuile(int direction) {
    setState(() {
      if (direction == 0) {
        _plateau[_emptyTileX][_emptyTileY] =
            _plateau[_emptyTileX - 1][_emptyTileY];
        _plateau[_emptyTileX - 1][_emptyTileY] = -1;
        _emptyTileX--;
      } else if (direction == 1) {
        _plateau[_emptyTileX][_emptyTileY] =
            _plateau[_emptyTileX + 1][_emptyTileY];
        _plateau[_emptyTileX + 1][_emptyTileY] = -1;
        _emptyTileX++;
      } else if (direction == 2) {
        _plateau[_emptyTileX][_emptyTileY] =
            _plateau[_emptyTileX][_emptyTileY - 1];
        _plateau[_emptyTileX][_emptyTileY - 1] = -1;
        _emptyTileY--;
      } else if (direction == 3) {
        _plateau[_emptyTileX][_emptyTileY] =
            _plateau[_emptyTileX][_emptyTileY + 1];
        _plateau[_emptyTileX][_emptyTileY + 1] = -1;
        _emptyTileY++;
      }
      _compteurDeplacements++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jeu de Taquin")),
      body: Column(
        children: [
          Text("Déplacements: $_compteurDeplacements"),
          _buildPlateau(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _initialiserPlateau();
                _compteurDeplacements = 0;
              });
            },
            child: Text("Réinitialiser"),
          ),
        ],
      ),
    );
  }

  Widget _buildPlateau() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _taille,
      ),
      itemCount: _taille * _taille,
      itemBuilder: (context, index) {
        int x = index ~/ _taille;
        int y = index % _taille;
        if (_plateau[x][y] == -1) {
          return Container(color: Colors.grey);
        } else {
          return GestureDetector(
            onTap: () {
              if (_isAdjacentToEmpty(x, y)) {
                _deplacerTuile(_getDirectionToEmptyTile(x, y));
              }
            },
            child: Container(
              margin: EdgeInsets.all(2),
              color: Colors.blue,
              child: Center(
                child: Text(
                  _plateau[x][y].toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  bool _isAdjacentToEmpty(int x, int y) {
    return (x == _emptyTileX &&
            (y == _emptyTileY - 1 || y == _emptyTileY + 1)) ||
        (y == _emptyTileY && (x == _emptyTileX - 1 || x == _emptyTileX + 1));
  }

  int _getDirectionToEmptyTile(int x, int y) {
    if (x == _emptyTileX - 1 && y == _emptyTileY) return 0;
    if (x == _emptyTileX + 1 && y == _emptyTileY) return 1;
    if (x == _emptyTileX && y == _emptyTileY - 1) return 2;
    if (x == _emptyTileX && y == _emptyTileY + 1) return 3;
    return -1;
  }
}
