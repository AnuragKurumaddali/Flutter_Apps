import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/util.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = getForecastData("London");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  weatherData = getForecastData("Hyderabad");
                });
              },
              icon: const Icon(
                Icons.refresh,
              ))
        ],
      ),
      body: FutureBuilder(
        future: weatherData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Text("An UnExpected error occurred! Please try after sometime");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final dynamic data = snapshot.data;
            if(data['cod'] != '200'){
              return const Center(child: Text("Please change the API Key!",style: TextStyle(fontSize: 18),));
            }
            final int itemCount = data['cnt'];
            final double mainTempDouble =
                data['list'][0]['main']['temp'] - kelvinToDegree;
            final String mainTemp = mainTempDouble.round().toString();
            final String weatherType = data['list'][0]['weather'][0]['main'];
            final IconData iconData = getWeatherIcon(weatherType);
            final String humidity =
                data['list'][0]['main']['humidity'].toString();
            final String windSpeed =
                data['list'][0]['wind']['speed'].toString();
            final String pressure =
                data['list'][0]['main']['pressure'].toString();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Main Card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "$mainTemp°C",
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Icon(
                                  iconData,
                                  size: 64,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  weatherType,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Hourly Forecast
                  const Text(
                    "Hourly Forecast",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: itemCount - 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final String time =
                            data['list'][index + 1]['dt_txt'].toString();
                        final parsedTime = DateTime.parse(time);
                        final String weatherType =
                            data['list'][index + 1]['weather'][0]['main'];
                        final IconData iconData = getWeatherIcon(weatherType);
                        final double tempDouble = data['list'][index + 1]
                                ['main']['temp'] -
                            kelvinToDegree;
                        final String temp = tempDouble.round().toString();
                        return HourlyForecastItem(
                          time: DateFormat.Hm().format(parsedTime),
                          iconData: iconData,
                          temp: temp,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Additional Information
                  const Text(
                    "Additional Information",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInformationItem(
                        iconData: Icons.water_drop,
                        title: "Humidity",
                        value: humidity,
                      ),
                      AdditionalInformationItem(
                        iconData: Icons.air,
                        title: "Wind Speed",
                        value: windSpeed,
                      ),
                      AdditionalInformationItem(
                        iconData: Icons.beach_access,
                        title: "Pressure",
                        value: pressure,
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}
