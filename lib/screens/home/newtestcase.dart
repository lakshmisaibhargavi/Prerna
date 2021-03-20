import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:prerna/home.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:http/http.dart' as http;

class Testcase extends StatefulWidget {
  final imei;
  final no;

  const Testcase({Key key, this.imei, this.no}) : super(key: key);
  @override
  _TestcaseState createState() => _TestcaseState();
}

Color backgroundColor = Color.fromRGBO(130, 205, 113, 1);

class _TestcaseState extends State<Testcase> {
  File _image2;
  File _image3;
  final picker = ImagePicker();
  File _image;
  int ph;
  String type = '';
  String type_soil = '';
  int temperature = 6;
  int him = 6;
  int mis = 6;
  int nitrogen = 200;
  bool afect = false;
  bool flowring = false;
  int co2;
  int o2;
  int potassium = 10;
  Position position;
  int iron;

  List _outputs;

  bool _loading = false;

  Future getImage_leaf() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        classifyImage_leaf(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage_soil() async {
    await Tflite.loadModel(
      model: "assets/soil_model_unquant.tflite",
      labels: "assets/soil_labels.txt",
      numThreads: 1,
    );
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image2 = File(pickedFile.path);
        classifyImage_soil(_image2);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  getlocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    /*_serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();*/
    print(position);
  }

  classifyImage_leaf(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      type = output[0]['label'];
      print(output[0]['label']);
    });
  }

  classifyImage_soil(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      type_soil = output[0]['label'];
      print(output[0]['label']);
    });
  }

  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    String name;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontSize:
                              MediaQuery.of(context).size.shortestSide > 400
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
                            'TEST CASE ${widget.no}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.shortestSide > 400
                                      ? 25
                                      : 18,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: width * 0.2,
                            color: Colors.brown,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                getImage_leaf();
                              });
                            },
                            child: Container(
                              child: _image == null
                                  ? Center(
                                      child: Text(
                                      ' LEAF IMAGE',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),
                                    ))
                                  : Image.file(
                                      _image,
                                      fit: BoxFit.cover,
                                      height: height * 0.08,
                                      width: width * 0.20,
                                    ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.green,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              height: height * 0.1,
                              width: width * 0.2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                getImage_soil();
                              });
                            },
                            child: Container(
                              child: _image2 == null
                                  ? Center(
                                      child: Text(
                                      'PLANT',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ))
                                  : Image.file(
                                      _image2,
                                      fit: BoxFit.cover,
                                      height: height * 0.08,
                                      width: width * 0.20,
                                    ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.green,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              height: height * 0.1,
                              width: width * 0.2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: GestureDetector(
                            onTap: () async {
                              final pickedFile = await picker.getImage(
                                  source: ImageSource.camera);

                              setState(() {
                                if (pickedFile != null) {
                                  _image3 = File(pickedFile.path);
                                } else {
                                  print('No image selected.');
                                }
                              });
                              setState(() {});
                            },
                            child: Container(
                              child: _image3 == null
                                  ? Center(
                                      child: Text(
                                      'LEAF',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ))
                                  : Image.file(
                                      _image3,
                                      fit: BoxFit.cover,
                                      height: height * 0.08,
                                      width: width * 0.20,
                                    ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.green,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              height: height * 0.1,
                              width: width * 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 2),
                    child: GestureDetector(
                      onTap: () {
                        ////get location
                        getlocation();
                      },
                      child: Container(
                        color: Colors.brown[300],
                        height: height * 0.03,
                        width: width * 0.2,
                        child: Center(
                          child: Text(
                            "Add  location",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text(
                      " * Nick Name",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Container(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.grey),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          hintText: "NICK NAME",
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 10),
                          border: InputBorder.none,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: width * 0.5,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 30),
                    child: GestureDetector(
                      onTap: () async {
                        await http
                            .patch(
                                'https://plantpay-4c635-default-rtdb.firebaseio.com/plants/${widget.imei + (widget.no.length).toString()}.json',
                                body: json.encode({
                                  'date': '${DateTime.now().day.toString()}',
                                  'name': '$name',
                                  'plant type': '$type',
                                  'soil type': '$type_soil',
                                  'location': '${position.toString()}',
                                  'temperature': '$temperature',
                                  'Humidity in air': '$him',
                                  'moisture in soil': '$mis',
                                  'nitrogen': '$nitrogen',
                                  'disease': afect,
                                  'Co2 observation': '$co2',
                                  'O2 releasing': '$o2',
                                  'ph': '$ph',
                                  'Potassium': '$potassium',
                                  'iron': '$iron',
                                  'Flowring': flowring
                                }))
                            .then((value) => print('hi'));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: width * 0.5,
                        child: Center(
                            child: Text(
                          "Add testcase ${widget.no}",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: -120,
              right: 0,
              child: Image.asset(
                'assets/plants4.png',
                height: height * 0.4,
              ))
        ],
      ),
    );
  }
}
