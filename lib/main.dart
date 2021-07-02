import 'dart:math';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnimatedSplashScreen(
          nextScreen: MyHomePage(),
          duration: 3000,
          splash: Image.asset("assets/aToz.png"),
          backgroundColor: Colors.blue,
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.scale,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    'Z',
    'P',
    'W',
    'B',
    'S',
    'N',
    'O',
    'D',
    'L',
    'C',
    'V',
    'G',
    'Q',
    'A',
    'X',
    'J',
    'F',
    'H',
    'R',
    'T',
    'E',
    'K',
    'Y',
    'I',
    'U',
    'M',
  ];

  String myImage;

  Function eq = const ListEquality().equals;

  List<String> aTozList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('A to Z Alphabets'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  items.shuffle();
                });
              })
        ],
      ),
      body: ReorderableListView(
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Arrange the Alphabets in order. Click and Hold on a List Tile to select and then move UP / DOWN to move the tile.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        children: <Widget>[
          for (var item in items)
            Card(
              key: ValueKey(item),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Text(item,
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                    Image(
                      width: 120,
                      height: 120,
                      image: setMyImage(item),
                    ),
                    Text(
                      setMyName(item),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)]),
                    )
                  ],
                ),
              ),
            ),
        ],
        scrollController: _homeController,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex -= 1;
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
            if (eq(items, aTozList)) {
              showDialog(
                  context: context,
                  builder: (_) => AssetGiffyDialog(
                        image: Image(image: AssetImage("assets/won.gif")),
                        title: Text(
                          "Congratulations ! You Won.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        description: Text(
                          'Press OK button to play again.',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                        entryAnimation: EntryAnimation.BOTTOM,
                        onlyOkButton: true,
                        onOkButtonPressed: () {
                          setState(() {
                            items.shuffle();
                            _homeController.animateTo(0,
                                duration: Duration(seconds: 1),
                                curve: Curves.decelerate);
                          });
                          Navigator.of(context).pop();
                        },
                      ));
            }
          });
        },
      ),
    );
  }

  setMyImage(String item) {
    if (item == 'A')
      return AssetImage('assets/A.gif');
    else if (item == 'B')
      return AssetImage('assets/B.gif');
    else if (item == 'C')
      return AssetImage('assets/C.gif');
    else if (item == 'D')
      return AssetImage('assets/D.gif');
    else if (item == 'E')
      return AssetImage('assets/E.gif');
    else if (item == 'F')
      return AssetImage('assets/F.gif');
    else if (item == 'G')
      return AssetImage('assets/G.gif');
    else if (item == 'H')
      return AssetImage('assets/H.gif');
    else if (item == 'I')
      return AssetImage('assets/I.gif');
    else if (item == 'J')
      return AssetImage('assets/J.gif');
    else if (item == 'K')
      return AssetImage('assets/K.gif');
    else if (item == 'L')
      return AssetImage('assets/L.gif');
    else if (item == 'M')
      return AssetImage('assets/M.gif');
    else if (item == 'N')
      return AssetImage('assets/N.gif');
    else if (item == 'O')
      return AssetImage('assets/O.gif');
    else if (item == 'P')
      return AssetImage('assets/P.gif');
    else if (item == 'Q')
      return AssetImage('assets/Q.gif');
    else if (item == 'R')
      return AssetImage('assets/R.gif');
    else if (item == 'S')
      return AssetImage('assets/S.gif');
    else if (item == 'T')
      return AssetImage('assets/T.gif');
    else if (item == 'U')
      return AssetImage('assets/U.gif');
    else if (item == 'V')
      return AssetImage('assets/V.gif');
    else if (item == 'W')
      return AssetImage('assets/W.gif');
    else if (item == 'X')
      return AssetImage('assets/X.gif');
    else if (item == 'Y')
      return AssetImage('assets/Y.gif');
    else if (item == 'Z') return AssetImage('assets/Z.gif');
  }

  setMyName(String item) {
    if (item == 'A')
      return "Apple";
    else if (item == 'B')
      return "Ball";
    else if (item == 'C')
      return "Cat";
    else if (item == 'D')
      return "Dog";
    else if (item == 'E')
      return "Elephant";
    else if (item == 'F')
      return "Fish";
    else if (item == 'G')
      return "Grass";
    else if (item == 'H')
      return "Hen";
    else if (item == 'I')
      return "Ice Cream";
    else if (item == 'J')
      return "Jug";
    else if (item == 'K')
      return "Kite";
    else if (item == 'L')
      return "Lion";
    else if (item == 'M')
      return "Monkey";
    else if (item == 'N')
      return "Nose";
    else if (item == 'O')
      return "Orange";
    else if (item == 'P')
      return "Parrot";
    else if (item == 'Q')
      return "Queen";
    else if (item == 'R')
      return "Rabbit";
    else if (item == 'S')
      return "Sun";
    else if (item == 'T')
      return "Tiger";
    else if (item == 'U')
      return "Umbrella";
    else if (item == 'V')
      return "Van";
    else if (item == 'W')
      return "Window";
    else if (item == 'X')
      return "X-mas";
    else if (item == 'Y')
      return "Yacht";
    else if (item == 'Z') return "Zebra";
  }
}
