import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:prerna/home.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:http/http.dart' as http;

class Addplant extends StatefulWidget {
  final imei;
  final no;

  const Addplant({Key key, this.imei, this.no}) : super(key: key);
  @override
  _AddplantState createState() => _AddplantState();
}

Color backgroundColor = Color.fromRGBO(130, 205, 113, 1);

class _AddplantState extends State<Addplant> {
  File _image2;
  File _image3;
  final picker = ImagePicker();
  File _image;

  String ph;
  String type = '';
  String type_soil = '';
  String temperature;
  String him;
  String mis;
  String nitrogen;
  String phosphorus;
  String zinc;
  String calcium;
  String magnisium;
  String manganese;
  bool afect = false;
  bool flowring = false;
  String co2;
  String o2;
  String potassium;
  String o2h;
  Position position;
  String iron;

  bool _serviceEnabled;

  List _outputs;

  bool _loading = false;

  var plantdata = {
    'Mango': {
      'Nitrogen': '27kg/acre',
      'Humidity': '65',
      'Diseased': false,
      'Flowering plant': true,
      'Carbon Dioxide': '9kg/year',
      'Oxygen': '25 kg/year',
      'Hours of Oxygen': '17',
      'Potassium': '30kg/acre',
      'Zinc': '2kg/acre',
      'Calcium': '12kg/acre',
      'Magnesium': '14',
      'Manganese': '3kg/acre',
      'Phosphorous': '7kg/acre',
    },
    'Aloevera': {
      'Nitrogen': '20kg/acre',
      'Humidity': '40',
      'Diseased': false,
      'Flowering plant': false,
      'Carbon Dioxide': '8kg/year',
      'Oxygen': '22kg/year',
      'Hours of Oxygen': '18',
      'Potassium': '20kg/acre',
      'Zinc': '0.5kg/acre',
      'Calcium': '2.5kg/acre',
      'Magnesium': '1.8kg/acre',
      'Manganese': '0.4kg/acre',
      'Phosphorous': '3kg/acre',
    },
    'Tulsi': {
      'Nitrogen': '48kg/acre',
      'Humidity': '100',
      'Diseased': false,
      'Flowering plant': true,
      'Carbon Dioxide': '10kg/year',
      'Oxygen': '32kg/year',
      'Hours of Oxygen': '20',
      'Potassium': '24 kg/acre',
      'Zinc': '1kg/acre',
      'Calcium': '3kg/acre',
      'Magnesium': '2kg/acre',
      'Manganese': '0.3kg/acre',
      'Phosphorous': '24kg/acre',
    },
    'Neem': {
      'Nitrogen': '40kg/acre',
      'Humidity': '800',
      'Diseased': false,
      'Flowering plant': true,
      'Carbon Dioxide': '10kg/year',
      'Oxygen': '29kg/year',
      'Hours of Oxygen': '19',
      'Potassium': '10kg/acre',
      'Zinc': '1kg/acre',
      'Calcium': '4kg/acre',
      'Magnesium': '3kg/acre',
      'Manganese': '2kg/acre',
      'Phosphorous': '20kg/acre',
    }
  };

  var soildata = {
    'Alluvial_Soil': {'iron': '1.2%', 'ph': '7', 'moisture': '21%'},
    'Black soil': {'iron': '10%', 'ph': '7.8', 'moisture': '60%'},
    'Clay soil': {'iron': '29%', 'ph': '6.3', 'moisture': '50%'},
    'Red soil': {'iron': '3.61%', 'ph': '5.5', 'moisture': '16%'},
  };
  // ignore: non_constant_identifier_names
  Future getImage_leaf() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        classifyImage_leaf(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  /////////////////////

  Future calc() {
    if (type == 'Mango') {
      setState(() {
        him = plantdata['Mango']['Humidity'];
        nitrogen = plantdata['Mango']['Nitrogen'];
        afect = plantdata['Mango']['Diseased'];
        flowring = plantdata['Mango']['Flowering plant'];
        co2 = plantdata['Mango']['Carbon Dioxide'];
        o2 = plantdata['Mango']['Oxygen'];
        o2h = plantdata['Mango']['Hours of Oxygen'];
        phosphorus = plantdata['Mango']['Phosphorous'];
        zinc = plantdata['Mango']['Zinc'];
        calcium = plantdata['Mango']['Calcium'];
        magnisium = plantdata['Mango']['Magnesium'];
        manganese = plantdata['Mango']['Manganese'];
        potassium = plantdata['Mango']['Potassium'];
      });
    } else if (type == 'Aloevera') {
      setState(() {
        him = plantdata['Aloevera']['Humidity'];
        nitrogen = plantdata['Aloevera']['Nitrogen'];
        afect = plantdata['Aloevera']['Diseased'];
        flowring = plantdata['Aloevera']['Flowering plant'];
        co2 = plantdata['Aloevera']['Carbon Dioxide'];
        o2 = plantdata['Aloevera']['Oxygen'];
        o2h = plantdata['Aloevera']['Hours of Oxygen'];
        phosphorus = plantdata['Aloevera']['Phosphorous'];
        zinc = plantdata['Aloevera']['Zinc'];
        calcium = plantdata['Aloevera']['Calcium'];
        magnisium = plantdata['Aloevera']['Magnesium'];
        manganese = plantdata['Aloevera']['Manganese'];
        potassium = plantdata['Aloevera']['Potassium'];
      });
    } else if (type == 'Tulsi') {
      setState(() {
        nitrogen = plantdata['Tulsi']['Nitrogen'];
        him = plantdata['Tulsi']['Humidity'];
        afect = plantdata['Tulsi']['Diseased'];
        flowring = plantdata['Tulsi']['Flowering plant'];
        co2 = plantdata['Tulsi']['Carbon Dioxide'];
        o2 = plantdata['Tulsi']['Oxygen'];
        o2h = plantdata['Tulsi']['Hours of Oxygen'];
        phosphorus = plantdata['Tulsi']['Phosphorous'];
        zinc = plantdata['Tulsi']['Zinc'];
        calcium = plantdata['Tulsi']['Calcium'];
        magnisium = plantdata['Tulsi']['Magnesium'];
        manganese = plantdata['Tulsi']['Manganese'];
        potassium = plantdata['Tulsi']['Potassium'];
      });
    } else {
      if (type == 'Neem') {
        setState(() {
          nitrogen = plantdata['Neem']['Nitrogen'];
          him = plantdata['Neem']['Humidity'];
          afect = plantdata['Neem']['Diseased'];
          flowring = plantdata['Neem']['Flowering plant'];
          co2 = plantdata['Neem']['Carbon Dioxide'];
          o2 = plantdata['Neem']['Oxygen'];
          o2h = plantdata['Neem']['Hours of Oxygen'];
          phosphorus = plantdata['Neem']['Phosphorous'];
          zinc = plantdata['Neem']['Zinc'];
          calcium = plantdata['Neem']['Calcium'];
          magnisium = plantdata['Neem']['Magnesium'];
          manganese = plantdata['Neem']['Manganese'];
          potassium = plantdata['Neem']['Potassium'];
        });
      }
    }
    if (type_soil == 'Alluvial_Soil') {
      setState(() {
        iron = soildata['Alluvial_Soil']['iron'];
        ph = soildata['Alluvial_Soil']['ph'];
        mis = soildata['Alluvial_Soil']['moisture'];
      });
    } else if (type_soil == 'Black soil') {
      setState(() {
        iron = soildata['Black soil']['iron'];
        ph = soildata['Black soil']['ph'];
        mis = soildata['Black soil']['moisture'];
      });
    } else if (type_soil == 'Clay soil') {
      setState(() {
        iron = soildata['Clay soil']['iron'];
        ph = soildata['Clay soil']['ph'];
        mis = soildata['Clay soil']['moisture'];
      });
    } else {
      setState(() {
        iron = soildata['Red soil']['iron'];
        ph = soildata['Red soil']['ph'];
        mis = soildata['Red soil']['moisture'];
      });
    }
  }
  //////////

  Future getImage_soil() async {
    await Tflite.loadModel(
      model: "assets/soil_model_unquant.tflite",
      labels: "assets/soil_labels.txt",
      numThreads: 1,
    );
    final pickedFile = await picker.getImage(source: ImageSource.camera);

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
    getlocation();
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

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
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
    String name = '';
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
                            'ADD  PLANT',
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
                                      ' LEAF',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
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
                                      'PLANTING',
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
                        keyboardType: TextInputType.name,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text(
                      " * Plant Type",
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
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          hintText: type,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text(
                      " * Soil Type",
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
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          hintText: type_soil,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text(
                      " * ADD ANY STORY ",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 28),
                          child: Row(
                            children: [
                              Container(
                                child: TextField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                  onChanged: (value) {},
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    hintText: "YOUR STORY HERE",
                                    hintStyle: TextStyle(
                                        color: Colors.green, fontSize: 10),
                                    border: InputBorder.none,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: width * 0.6,
                                height: height * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 30),
                    child: GestureDetector(
                      onTap: () async {
                        await calc();
                        await http
                            .patch(
                                'https://plantpay-4c635-default-rtdb.firebaseio.com/plants/${widget.imei + (widget.no.length).toString()}.json',
                                body: json.encode({
                                  'date': '${DateTime.now().toString()}',
                                  'name': '$name',
                                  'plant type': '$type',
                                  'soil type': '$type_soil',
                                  'location': '${position.toString()}',
                                  'temperature': '$temperature',
                                  'Humidity in air': '$him',
                                  'moisture in soil': '$mis',
                                  'nitrogen': '$nitrogen',
                                  'disease': afect,
                                  'Flowering': flowring,
                                  'Co2 absorption': '$co2',
                                  'O2 releasing': '$o2',
                                  'Hours of oxygen released': '$o2h',
                                  'ph': '$ph',
                                  'phosphorus': '$phosphorus',
                                  'zinc': '$zinc',
                                  'calcium': '$calcium',
                                  'magnesium': '$magnisium',
                                  'manganese': '$manganese',
                                  'Potassium': '$potassium',
                                  'iron': '$iron',
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
                          "PLANT",
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
