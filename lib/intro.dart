import 'package:prerna/Indform.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
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
        Container(
          color: Colors.black54,
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          child: Center(child: Image.asset('assets/logo.png')),
        ),
        SizedBox(height: 16),
        SizedBox(height: 32),
        Text(
          "Welcome",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.shortestSide > 400 ? 60 : 40,
          ),
        ),
        SizedBox(height: 32),
        RotatedBox(
          quarterTurns: 3,
          child: IconButton(
            icon: Icon(Icons.arrow_circle_down),
            iconSize: 70,
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Indform()),
              );
            },
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
