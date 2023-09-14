import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ulesson_http/models/weather.dart';
import 'package:ulesson_http/reponsitory/weather_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  String _temperature = 'No Data';

  _getWeather() async {
    setState(() => _isLoading = true);

    String str = await WeatherRepo().getWeather();
    if (str.isNotEmpty) _temperature = str;

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator.adaptive()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_temperature),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getWeather();
        },
        child: const Icon(Icons.api),
      ),
    );
  }
}
