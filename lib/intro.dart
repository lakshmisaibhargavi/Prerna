import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:prerna/bori.dart';

class Intropage extends StatefulWidget {
  Intropage({Key key}) : super(key: key);

  @override
  _IntropageState createState() => _IntropageState();
}

Color backgroundColor = Color.fromRGBO(130, 205, 113, 1);
Color darkerColor = Color.fromRGBO(130, 205, 113, 1);

class _IntropageState extends State<Intropage> {
  ScrollController _scrollController;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;
  final fb = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
    _onPressed();
  }

  void _onPressed() {
    fb.collection("users").doc('hello').set({
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    }).then((value) {
      print("done");
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: screenHeight,
            child: RepaintBoundary(
              child: Image.asset(
                'assets/back2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0.2 * screenHeight,
            left: 0,
            right: 0,
            child: MainText(),
          ),
          Positioned(
            top: screenHeight * 0.705 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: RepaintBoundary(
              child: Image.asset(
                'assets/wave.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.9 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight * 0.2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0,
                      1
                    ],
                    colors: [
                      backgroundColor.withOpacity(0.2),
                      Colors.white,
                    ]),
              ),
            ),
          ),
          Scrollbar(
            child: ListView(
              cacheExtent: 64,
              controller: _scrollController,
              children: <Widget>[
                Container(height: screenHeight),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ip1.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  color: backgroundColor,
                  height: height > width ? height * 0.55 : height * 0.5,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Image.asset(
                        'assets/p1.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        top: -130,
                        right: 0,
                        child: Image.asset(
                          'assets/c1.png',
                          height: height * 0.6,
                          width: width * 0.6,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: backgroundColor,
                  height: height > width ? height * 0.4 : height * 0.8,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      Image.asset(
                        'assets/p2.png',
                        height: height * 0.7,
                        width: width * 0.7,
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        top: -120,
                        left: 0,
                        child: Image.asset(
                          'assets/c2.png',
                          height: height * 0.5,
                          width: width * 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.2,
                  child: Center(
                    child: Card(
                      elevation: 20,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Comind()),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: width * 0.7,
                          child: Center(
                              child: Text(
                            "LET'S SAVE THE PLANET",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.brown[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String plant = "Plant";

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'THE PLANT WORLD',
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: MediaQuery.of(context).size.shortestSide > 400 ? 40 : 30,
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 2,
          width: 104,
          color: Colors.greenAccent,
        ),
        SizedBox(height: 32),
        Text(
          "Welcome to PlantPay",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.shortestSide > 400 ? 60 : 40,
          ),
        ),
        SizedBox(height: 32),
        RotatedBox(
          quarterTurns: 2,
          child: Icon(LineIcons.angle_double_up, color: Colors.white),
        ),
        SizedBox(height: 16),
        Text('SCROLL DOWN', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
