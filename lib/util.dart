import 'dart:convert';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey = "";//Please get the API key from Open Weather Website
const double kelvinToDegree = 273.15;

/*
* This Method takes the Type of Weather and returns the image in IconData format.
* param : String weatherType
*/
IconData getWeatherIcon(String weatherType){
  switch(weatherType){
    case "Clouds":
      return Icons.cloud;
    case "Rain":
      return Icons.shower;
    case "Clear":
      return Icons.sunny;
    default:
      return Icons.cloud;
  }
}

/*
* This Method returns the weatherForecast data from the OpenWeather API by taking CityName as input from the user
* param : String cityName
*/
Future<Map<String,dynamic>> getForecastData(String cityName) async{
  String url = "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey";
  final res = await http.get(Uri.parse(url));
  final data = jsonDecode(res.body);
  return data;
}

class HourlyForecastItem extends StatelessWidget {
  final String time,temp;
  final IconData iconData;
  const HourlyForecastItem({super.key, required this.time, required this.temp, required this.iconData,});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8,
              sigmaY: 8,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    time,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Icon(
                    iconData,
                    size: 32,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("$temp°C"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AdditionalInformationItem extends StatelessWidget {
  final IconData iconData;
  final String title, value;

  const AdditionalInformationItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(size: 32, iconData),
        const SizedBox(
          height: 8,
        ),
        Text(title),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
