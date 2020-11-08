import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{

Position _position;
 double _latitude ;
 double _longitude;

Future <void> getCurrentLocation() async {
    try{
    _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(_position);
    _latitude = _position.latitude;
    _longitude = _position.longitude;
    }
    catch (e){
      print(e);
    }
  }
  double getLatitude() {
   return   _latitude;
  }
  double getLongitude() {
    return  _longitude;
  }
}