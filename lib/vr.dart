import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class Vrpage extends StatefulWidget {
  final img;

  const Vrpage({Key key, this.img}) : super(key: key);
  @override
  _VrpageState createState() => _VrpageState();
}

class _VrpageState extends State<Vrpage> {
  @override
  Widget build(BuildContext context) {
    double _lon = 0;
    double _lat = 0;
    double _tilt = 0;
    int _panoId = 0;
    List<Image> panoImages = [
      Image.asset('${widget.img}'),
    ];

    void onViewChanged(longitude, latitude, tilt) {
      setState(() {
        _lon = longitude;
        _lat = latitude;
        _tilt = tilt;
      });
    }

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Panorama(
            animSpeed: 1.0,
            sensorControl: SensorControl.Orientation,
            onViewChanged: onViewChanged,
            onTap: (longitude, latitude, tilt) =>
                print('onTap: $longitude, $latitude, $tilt'),
            onLongPressStart: (longitude, latitude, tilt) =>
                print('onLongPressStart: $longitude, $latitude, $tilt'),
            onLongPressMoveUpdate: (longitude, latitude, tilt) =>
                print('onLongPressMoveUpdate: $longitude, $latitude, $tilt'),
            onLongPressEnd: (longitude, latitude, tilt) =>
                print('onLongPressEnd: $longitude, $latitude, $tilt'),
            child: Image.asset('${widget.img}'),
            hotspots: [
              Hotspot(
                latitude: -15.0,
                longitude: -129.0,
                width: 90,
                height: 75,
              ),
              Hotspot(
                latitude: -42.0,
                longitude: -46.0,
                width: 60.0,
                height: 60.0,
              ),
              Hotspot(
                latitude: -33.0,
                longitude: 123.0,
                width: 60.0,
                height: 60.0,
              ),
            ],
          ),
        ),
        Container(height: 10, color: Colors.white),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Panorama(
              animSpeed: 1.0,
              sensorControl: SensorControl.Orientation,
              onViewChanged: onViewChanged,
              onTap: (longitude, latitude, tilt) =>
                  print('onTap: $longitude, $latitude, $tilt'),
              onLongPressStart: (longitude, latitude, tilt) =>
                  print('onLongPressStart: $longitude, $latitude, $tilt'),
              onLongPressMoveUpdate: (longitude, latitude, tilt) =>
                  print('onLongPressMoveUpdate: $longitude, $latitude, $tilt'),
              onLongPressEnd: (longitude, latitude, tilt) =>
                  print('onLongPressEnd: $longitude, $latitude, $tilt'),
              child: Image.asset('${widget.img}'),
              hotspots: [
                Hotspot(
                  latitude: -15.0,
                  longitude: -129.0,
                  width: 90,
                  height: 75,
                ),
                Hotspot(
                  latitude: -42.0,
                  longitude: -46.0,
                  width: 60.0,
                  height: 60.0,
                ),
                Hotspot(
                  latitude: -33.0,
                  longitude: 123.0,
                  width: 60.0,
                  height: 60.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
