import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController? mapController;
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition? _center;
  Marker? _marker;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosition();
  }

  Future getPosition() async {
    getUserCurrentLocation().then((value) async {
      _center = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 16.0,
      );
      _marker = Marker(
        markerId: MarkerId('Me'),
        position: LatLng(value.latitude, value.longitude),
      );
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_center ?? CameraPosition(
          target: LatLng(0, 0),
          zoom: 16
      )));
      setState(() {});
    });
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            markers: {
              _marker ?? Marker(markerId: MarkerId("Me"), position: LatLng(0, 0))
            },
            onMapCreated: _onMapCreated,
            initialCameraPosition: _center ?? CameraPosition(
              target: LatLng(0, 0),
              zoom: 16
            )
        ),
        Positioned(
          bottom: 10,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black))
            ),
            child: Text(
              "Начать запись маршрута",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: (){},


          ),
        )
      ],
    );
  }
}