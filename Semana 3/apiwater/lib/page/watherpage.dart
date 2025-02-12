import 'package:apiwater/model/wather_model.dart';
import 'package:apiwater/services/wather_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Watherpage extends StatefulWidget {
  const Watherpage({super.key});

  @override
  State<Watherpage> createState() => _WatherpageState();
}

class _WatherpageState extends State<Watherpage> {
  // api key
  final _watherService = WatherService('2d6f1db34d02373c1ce9c7e5a07ffcc0');
  Wather? _wather;

  // get the current city
  _fetchWather() async {
    String cityName = await _watherService.getCurrentCity();

    // get the wather city

    try {
      final water = await _watherService.getWather(cityName);
      setState(() {
        _wather = water;
      });
    } catch (e) {
      print(e);
    }
  }

  //weather animation
  String getWeatherAnimation(String? maincodition) {
    if (maincodition == null) {
      return 'assets/sun.json';
    } 
    
    switch (maincodition.toLowerCase()){
      case 'clear':
        return 'assets/sun.json';
      case 'clouds':
        return 'assets/cloud.json';
      case 'rain':
        return 'assets/rain.json';
      case 'snow':
        return 'assets/snow.json';
      default:
        return 'assets/sun.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_wather?.cityName ?? 'Loading...'),
          Lottie.asset('assets/sun.json'),
          Text('${_wather?.temperature.round()}°C'),
        ],
      ),
    ));
  }
}
