import 'package:prerna/constants/constants.dart';
import 'package:flutter/material.dart';

class Specifications extends StatefulWidget {
  final List specification;

  Specifications(this.specification);

  @override
  _SpecificationsState createState() => _SpecificationsState();
}

class _SpecificationsState extends State<Specifications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: appPadding * 1.5),
        child: Row(
          children: [
            Container(
              width: size.width * 0.55,
              height: size.height * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Specifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Volkhov',
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
