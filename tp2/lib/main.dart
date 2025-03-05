import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

math.Random random = new math.Random();

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
                      if (j == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AfficherUneImage(),
                          ),
                        );
                      }

                      if (j == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransformerUneImage(),
                          ),
                        );
                      }

                      if (j == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuEtNavigation(),
                          ),
                        );
                      }

                      if (j == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Tuile(),
                          ),
                        );
                      }

                      if (j == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Plateau(),
                          ),
                        );
                      }

                      if (j == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PositionedTiles(),
                          ),
                        );
                      }

                      if (j == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Taquin(),
                          ),
                        );
                      }
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
                          "Exercice $j",
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
  ui.Image? _fullImage;
  List<ui.Image>? _tiles;

  @override
  void initState() {
    super.initState();
    _loadImage(imageUrl);
  }

  void _loadImage(String url) {
    final imageStream = NetworkImage(url).resolve(ImageConfiguration());

    imageStream.addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          setState(() {
            _fullImage = info.image;
          });
          _splitImage();
        },
        onError: (exception, stackTrace) {
          setState(() {
            _fullImage = null;
          });
          print('Erreur de chargement de l\'image: $exception');
        },
      ),
    );
  }

  Future<void> _splitImage() async {
    if (_fullImage == null) return;

    int tileSize = (_fullImage!.width / gridSize).floor();
    List<ui.Image> tiles = [];

    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        ui.PictureRecorder recorder = ui.PictureRecorder();
        Canvas canvas = Canvas(recorder);
        Paint paint = Paint();

        canvas.drawImageRect(
          _fullImage!,
          Rect.fromLTWH(j * tileSize.toDouble(), i * tileSize.toDouble(),
              tileSize.toDouble(), tileSize.toDouble()),
          Rect.fromLTWH(0, 0, tileSize.toDouble(), tileSize.toDouble()),
          paint,
        );

        ui.Image tileImage =
            await recorder.endRecording().toImage(tileSize, tileSize);
        tiles.add(tileImage);
      }
    }

    setState(() {
      _tiles = tiles;
    });
  }

  Future<Uint8List> _imageToBytes(ui.Image image) async {
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double tileWidth = screenWidth / gridSize;
    double tileHeight = screenHeight / gridSize;

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
                      _tiles = null;
                    });
                    _splitImage();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: _fullImage == null
                ? Center(child: CircularProgressIndicator())
                : _tiles == null
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gridSize,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemCount: _tiles!.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder<Uint8List>(
                            future: _imageToBytes(_tiles![index]),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasData) {
                                return Container(
                                  width: tileWidth,
                                  height: tileHeight,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: MemoryImage(snapshot.data!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              } else {
                                return Center(child: Text("Erreur d'image"));
                              }
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

//  EXO 6

class Tile {
  late Color color;
  late int id;

  Tile(this.color);

  Tile.randomColor() {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  void vide() {
    this.color = Color.fromARGB(0, 0, 0, 0);
  }
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return this.coloredBox();
  }

  Widget coloredBox() {
    return Container(
        color: tile.color,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles_init =
      List<Widget>.generate(16, (index) => TileWidget(Tile.randomColor()));

  List<Widget> tiles =
      List<Widget>.generate(16, (index) => TileWidget(Tile.randomColor()));

  void quiestou(int tuile_vide) {
    print("tuile vide ${tuile_vide}");
  }

  bool estacote(int pos_vide, int pos_cliquee, int nb_tuile) {
    if (pos_cliquee - 1 == pos_vide ||
        pos_cliquee + 1 == pos_vide ||
        pos_cliquee - nb_tuile == pos_vide ||
        pos_cliquee + nb_tuile == pos_vide) {
      return true;
    }
    return false;
  }

  int nb_tuile = 4;
  int tuile_vide = random.nextInt(16 - 1);
  int tuile_vide_init = -1;

  bool gagner() {
    if (tuile_vide != tuile_vide_init) {
      return false;
    }
    for (int i = 0; i < nb_tuile * nb_tuile - 1; i++) {}
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Moving Tiles'),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 1.0,
              ),
              itemCount: tiles.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      if (estacote(tuile_vide, index, nb_tuile)) {
                        swapTiles(tuile_vide, index);
                        tuile_vide = index;
                        print(tuile_vide);
                      }
                    },
                    child: tiles[index]);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              intialisation(tuile_vide);
            },
            child: Text('Jouer'),
          ),
        ]));
  }

  intialisation(int tuile_vide) {
    setState(() {
      Tile tile = (tiles[tuile_vide] as TileWidget).tile;
      tiles;
      tile.vide();
      tuile_vide_init = tuile_vide;

      tiles[tuile_vide] = TileWidget(tile);
    });
  }

  swapTiles(int i, int j) {
    setState(() {
      Widget inter_tile = tiles[i];

      tiles[i] = tiles[j];
      tiles[j] = inter_tile;
    });
  }
}

//  EXO 7 Taquin

class Tile2 {
  late ui.Image image;
  late bool isEmpty;
  final int correctPosition;

  Tile2(this.image, {this.isEmpty = false, required this.correctPosition});
}

class TileWidget2 extends StatelessWidget {
  final Tile2 tile;
  final double tileWidth;
  final double tileHeight;

  TileWidget2(this.tile, this.tileWidth, this.tileHeight);

  @override
  Widget build(BuildContext context) {
    return tile.isEmpty
        ? Container(color: Colors.white)
        : FutureBuilder<Uint8List>(
            future: _imageToBytes(tile.image),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData) {
                return Container(
                  width: tileWidth,
                  height: tileHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(snapshot.data!),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else {
                return Center(child: Text("Erreur d'image"));
              }
            },
          );
  }

  Future<Uint8List> _imageToBytes(ui.Image image) async {
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }
}

class Taquin extends StatefulWidget {
  @override
  _TaquinState createState() => _TaquinState();
}

class _TaquinState extends State<Taquin> {
  int gridSize = 3;
  String imageUrl = 'https://picsum.photos/512/512';
  ui.Image? _fullImage;
  List<Tile2>? _tiles;
  int _emptyTileIndex = -1;
  int _moveCount = 0;
  bool _isSolved = false;

  @override
  void initState() {
    super.initState();
    _loadImage(imageUrl);
  }

  void _loadImage(String url) {
    final imageStream = NetworkImage(url).resolve(ImageConfiguration());

    imageStream.addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          setState(() {
            _fullImage = info.image;
          });
          _splitImage();
        },
        onError: (exception, stackTrace) {
          setState(() {
            _fullImage = null;
          });
          print('Erreur de chargement de l\'image: $exception');
        },
      ),
    );
  }

  Future<void> _splitImage() async {
    if (_fullImage == null) return;

    int tileSize = (_fullImage!.width / gridSize).floor();
    List<Tile2> tiles = [];

    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        ui.PictureRecorder recorder = ui.PictureRecorder();
        Canvas canvas = Canvas(recorder);
        Paint paint = Paint();

        canvas.drawImageRect(
          _fullImage!,
          Rect.fromLTWH(j * tileSize.toDouble(), i * tileSize.toDouble(),
              tileSize.toDouble(), tileSize.toDouble()),
          Rect.fromLTWH(0, 0, tileSize.toDouble(), tileSize.toDouble()),
          paint,
        );

        ui.Image tileImage =
            await recorder.endRecording().toImage(tileSize, tileSize);

        tiles.add(Tile2(tileImage, correctPosition: i * gridSize + j));
      }
    }

    int emptyTileIndex = math.Random().nextInt(gridSize * gridSize);
    tiles[emptyTileIndex] = Tile2(tiles[emptyTileIndex].image,
        isEmpty: true, correctPosition: emptyTileIndex);

    _shuffleTiles(tiles, emptyTileIndex);

    setState(() {
      _tiles = tiles;
      _emptyTileIndex = emptyTileIndex;
      _moveCount = 0;
      _isSolved = false;
    });
  }

  void _shuffleTiles(List<Tile2> tiles, int emptyTileIndex) {
    int inversions = 0;
    do {
      tiles.shuffle();
      inversions = _countInversions(tiles);
    } while (inversions % 2 != 0);

    if (tiles[emptyTileIndex].isEmpty == false) {
      for (int i = 0; i < tiles.length; i++) {
        if (tiles[i].isEmpty) {
          Tile2 temp = tiles[i];
          tiles[i] = tiles[emptyTileIndex];
          tiles[emptyTileIndex] = temp;
          break;
        }
      }
    }
  }

  int _countInversions(List<Tile2> tiles) {
    int inversions = 0;
    for (int i = 0; i < tiles.length - 1; i++) {
      for (int j = i + 1; j < tiles.length; j++) {
        if (!tiles[i].isEmpty &&
            !tiles[j].isEmpty &&
            tiles[i].correctPosition > tiles[j].correctPosition) {
          inversions++;
        }
      }
    }
    return inversions;
  }

  bool estacote(int pos_vide, int pos_cliquee) {
    int rowVide = pos_vide ~/ gridSize;
    int colVide = pos_vide % gridSize;
    int rowCliquee = pos_cliquee ~/ gridSize;
    int colCliquee = pos_cliquee % gridSize;

    return (rowVide == rowCliquee &&
            (colCliquee == colVide - 1 || colCliquee == colVide + 1)) ||
        (colVide == colCliquee &&
            (rowCliquee == rowVide - 1 || rowCliquee == rowVide + 1));
  }

  void swapTiles(int i, int j) {
    setState(() {
      Tile2 temp = _tiles![i];
      _tiles![i] = _tiles![j];
      _tiles![j] = temp;

      if (_tiles![i].isEmpty) {
        _emptyTileIndex = i;
      } else if (_tiles![j].isEmpty) {
        _emptyTileIndex = j;
      }

      _moveCount++;
      _checkIfSolved();
    });
  }

  void _checkIfSolved() {
    bool isSolved = true;
    for (int i = 0; i < _tiles!.length; i++) {
      if (!_tiles![i].isEmpty && _tiles![i].correctPosition != i) {
        isSolved = false;
        break;
      }
    }

    if (isSolved) {
      setState(() {
        _isSolved = true;
      });
      _showWinDialog();
    }
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Bravo !"),
          content: Text("Vous avez gagné en $_moveCount déplacements !"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _rejouer() {
    setState(() {
      imageUrl =
          'https://picsum.photos/512/512?random=${DateTime.now().millisecondsSinceEpoch}';
      _fullImage = null;
      _tiles = null;
      _emptyTileIndex = -1;
      _moveCount = 0;
      _isSolved = false;
    });
    _loadImage(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double tileWidth = screenWidth / gridSize;
    double tileHeight = screenHeight / gridSize;

    return Scaffold(
      appBar: AppBar(
        title: Text("Plateau de Taquin"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.7,
              child: _fullImage == null || _tiles == null
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridSize,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemCount: _tiles!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (!_isSolved &&
                                estacote(_emptyTileIndex, index)) {
                              swapTiles(_emptyTileIndex, index);
                            }
                          },
                          child: TileWidget2(
                            _tiles![index],
                            tileWidth,
                            tileHeight,
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
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
                        _tiles = null;
                      });
                      _splitImage();
                    },
                  ),
                  Text("Déplacements : $_moveCount"),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _rejouer,
                    icon: Icon(Icons.refresh),
                    label: Text("Rejouer"),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                    ),
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
