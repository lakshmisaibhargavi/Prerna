import 'package:prerna/constants/constants.dart';
import 'package:prerna/home.dart';
import 'package:prerna/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BackgroundAndDetails extends StatefulWidget {
  final Plant plant;

  BackgroundAndDetails(this.plant);

  @override
  _BackgroundAndDetailsState createState() => _BackgroundAndDetailsState();
}

class _BackgroundAndDetailsState extends State<BackgroundAndDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.brown[100],
            Colors.brown[200],
            Colors.brown[300],
          ],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
      ),
      child: Container(
        height: size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: appPadding, vertical: appPadding * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: appPadding * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.plant.name,
                    style: TextStyle(
                        color: black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Volkhov'),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Height',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '${widget.plant.height}cm',
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Category',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '${widget.plant.category}',
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
