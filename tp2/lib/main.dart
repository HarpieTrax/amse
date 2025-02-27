import 'package:flutter/material.dart';

void main() {
  runApp(Categorie());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("tp2_taquin"),
        backgroundColor: Colors.blue),
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




class Categorie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(title: Text("Exercice",
       style: TextStyle(
        color: Colors.white
       ),
       ),
       backgroundColor: Colors.blue
       ),
       body: Builder(
        builder: (context){
          return Column(
      children: [

        for (int j=0;j<7;j++)

            ListTile(
              
              title: TextButton(
                onPressed: (){
                  if(j==5)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Plateau(
                                  ),
                                ),
                              );

                  if (j==4)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tuile(
                                  ),
                                ),
                              );
                            },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Padding
                  textStyle: TextStyle(fontSize: 20),
                        ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Exercice ${j}",
                    ),
                  ],
                ),
              ),
            ),
        ],
          );
        }
      ),
      )
    );
  }
}


class Tuile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Affichage d'une tuile de l'image"),
      ),
        body: SingleChildScrollView(
          padding : const EdgeInsets.all(16.0),
          child : 
          Center (
            child:
          Column(
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment(0,0),
                heightFactor: 0.4,
                widthFactor: 0.4,
                child: Image.network(
                    'https://picsum.photos/512/512',

                ),
              ),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment(0.5,0),
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

            ]
          ),
        ),
      )
    );
  }
}


class Plateau extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Affichage d'une tuile de l'image"),
      ),
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: [
          for (int i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++)
              ClipRect(
                child: Align(
                  alignment: Alignment((i - 1) * 2 / 3, (j - 1) * 2 / 3),
                  heightFactor: 1 / 3,
                  widthFactor: 1 / 3,
                  child: Image.network(
                    'https://picsum.photos/512/512',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
