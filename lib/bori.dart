import 'package:flutter/material.dart';
import 'package:prerna/Comform.dart';
import 'package:prerna/Indform.dart';

class Comind extends StatefulWidget {
  const Comind({Key key}) : super(key: key);
  @override
  _ComindState createState() => _ComindState();
}

Color backgroundColor = Color.fromRGBO(130, 205, 113, 1);

class _ComindState extends State<Comind> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
              bottom: -height * 0.1,
              left: -width * 0.8,
              right: 0,
              child: Image.asset(
                'assets/individual.png',
                height: height * 0.6,
              )),
          Container(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(height: height * 0.06),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      '<- Back',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.shortestSide > 400
                            ? 18
                            : 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.08),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Text(
                          'CHOOSE CATEGORY',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.shortestSide > 400
                                    ? 25
                                    : 18,
                          ),
                        ),
                        Container(
                          color: Colors.brown,
                          height: 2,
                          width: width * 0.3,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(height: height * 0.15),
                Card(
                  elevation: 20,
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ComForm()),
                      );
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.7,
                      child: Center(
                          child: Text(
                        "COMPANY",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.deepOrange,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.2),
                Card(
                  elevation: 20,
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Indform()),
                      );
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.7,
                      child: Center(
                          child: Text(
                        "INDIVIDUAL",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.deepOrange,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/p3.png',
              height: height * 0.35,
              width: width * 0.4,
            ),
          ),
          Positioned(
            bottom: -100,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/sand.png',
              height: height * 0.3,
              width: width * 0.4,
            ),
          ),
          Positioned(
              top: height * 0.40,
              left: 0,
              right: -230,
              child: Image.asset(
                'assets/company.png',
                height: height * 0.2,
              )),
        ],
      ),
    );
  }
}
