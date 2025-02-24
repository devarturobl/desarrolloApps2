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
  final _watherService = WatherService('1561c382aa81ad32430d8d02764a1f91');
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
      return 'assets/default.json';
    }

    switch (maincodition.toLowerCase()) {
      case 'fog':
        return 'assets/cloud.json';
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sun.json';
      default:
        return 'assets/default.json';
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
          Text(
            _wather?.cityName ?? 'Loading...',
            style: TextStyle(fontSize: 20),
          ),
          Lottie.asset(getWeatherAnimation(_wather?.mainCodition)),
          Text('${_wather?.temperature.round()}°C',
              style: TextStyle(fontSize: 20)),
        ],
      ),
    ));
  }
}
