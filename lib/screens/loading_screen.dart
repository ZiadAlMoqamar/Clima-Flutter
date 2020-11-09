import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
  
@override
  void initState() {
    
    super.initState();
    getLocation();
  }
   void getLocation() async{
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    print(currentLocation.getLatitude());
    print(currentLocation.getLongitude());
  }
  void getData() async{
    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
     if(response.statusCode==200){
       String data = response.body;
       var decodedData = jsonDecode(data);
       var temperature = decodedData['main']['temp'];
       var condition = decodedData['weather'][0]['id'];
       var cityName = decodedData['name'];
       print(temperature);
       print(condition);
       print(cityName);
     } else{
       print(response.statusCode);
     }
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      
    );
  }
}
