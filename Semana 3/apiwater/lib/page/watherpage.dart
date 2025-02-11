import 'package:apiwater/model/wather_model.dart';
import 'package:apiwater/services/wather_service.dart';
import 'package:flutter/material.dart';

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
    } 
    catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
