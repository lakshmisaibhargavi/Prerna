import 'package:prerna/screens/home/addplant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prerna/screens/myplant.dart';
import 'components/trending_this_week.dart';

Color backgroundColor = Colors.blue.shade200;

class Newplant extends StatefulWidget {
  final imei;

  final data;

  const Newplant({Key key, this.imei, this.data}) : super(key: key);

  @override
  _NewplantState createState() => _NewplantState();
}

class _NewplantState extends State<Newplant> {
  @override
  Widget build(BuildContext context) {
    // it will return the size of the screen
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: backgroundColor,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TrendingThisWeek(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 3),
                    child: Text(
                      "LAST PLANTED ON  :   20-02-20",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "TOTAL PLANTS PLANTED  :   ${widget.data.length - 1}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Myplant(
                    data: widget.data,
                    imei: widget.imei,
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.60,
                child: Image.asset(
                  'assets/plants5.png',
                  height: 500,
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 0,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Addplant(imei: widget.imei, no: widget.data),
                      ));
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Text(
                  "ADD Plant",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
