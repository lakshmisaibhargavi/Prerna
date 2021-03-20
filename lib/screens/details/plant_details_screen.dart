import 'package:prerna/home.dart';
import 'package:prerna/models/plant.dart';
import 'package:flutter/material.dart';

import 'components/background_and_details.dart';
import 'components/information.dart';
import 'components/plant_image.dart';
import 'components/specifications.dart';

class PlantDetailsScreen extends StatefulWidget {
  final Plant plant;

  PlantDetailsScreen({this.plant});

  @override
  _PlantDetailsScreenState createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Column(
              children: [
                BackgroundAndDetails(widget.plant),
                Information(widget.plant.description),
                Specifications(widget.plant.specifications),
              ],
            ),
            PlantImage(widget.plant.imageUrl),
          ],
        ),
      ),
    );
  }
}
