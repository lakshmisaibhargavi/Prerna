import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade200, Colors.blue.shade200],
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Erza Scarlet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Photographer',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Card(
                          child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: Column(
                              children: [
                                Text(
                                  'Battles',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "$counter",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                )
                              ],
                            )),
                            Container(
                              child: Column(children: [
                                Text(
                                  'Birthday',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'April 7th',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                )
                              ]),
                            ),
                            Container(
                                child: Column(
                              children: [
                                Text(
                                  'Age',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '19 yrs',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      )),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
