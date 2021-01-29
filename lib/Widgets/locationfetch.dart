import 'package:flutter/material.dart';
import 'package:food_delivery/Screens/Homescreen.dart';
import 'location.dart';
import 'networking.dart';

class Locationfetch extends StatefulWidget {
  @override
  _LocationfetchState createState() => _LocationfetchState();
}

class _LocationfetchState extends State<Locationfetch> {
  double Lat;
  double Long;
  var weatherData ;
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async
  {
    Location location = Location();
    await location.getLocation();
    Lat = location.latitude;
    Long = location.longitude;
    var params = {
      'lat': Lat.toString(),
      'lon': Long.toString(),
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
    Networkhelper networkHelper = Networkhelper(query);
    var weatherData = await networkHelper.getresdata();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return HomeScreen(locationData: weatherData,);
    }));


  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
      )
    );
  }
}


