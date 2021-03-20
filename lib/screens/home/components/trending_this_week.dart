import 'package:prerna/constants/constants.dart';
import 'package:prerna/data/data.dart';
import 'package:prerna/models/plant.dart';
import 'package:prerna/screens/details/plant_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingThisWeek extends StatelessWidget {
  Widget _buildTrendingPlants(BuildContext context, int index) {
    Plant plant = trendingPlants[index];
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlantDetailsScreen(plant: plant),
          ),
        ),
      },
      child: Padding(
        padding: EdgeInsets.only(right: appPadding, bottom: appPadding),
        child: Container(
          width: size.width * 0.3,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.4),
                  offset: Offset(10, 10),
                  blurRadius: 10.0)
            ],
          ),
          padding: EdgeInsets.all(appPadding / 2),
          child: Stack(
            children: [
              Text(
                '${plant.name}',
                maxLines: 1,
                style: TextStyle(
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Volkhov'),
              ),
              Positioned(
                  bottom: size.height * 0.02,
                  left: 10,
                  right: 0,
                  child: Container(
                    height: size.height * 0.14,
                    child: Image.asset(plant.imageUrl),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Color backgroundColor = Color.fromRGBO(130, 205, 113, 1);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: appPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'MOST PREFERED PLANTS',
                style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Volkhov',
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
              child: Container(
                height: size.height * 0.2,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingPlants.length,
                    itemBuilder: (context, index) {
                      return _buildTrendingPlants(context, index);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
