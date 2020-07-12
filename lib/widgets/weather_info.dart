import 'package:flutter/material.dart';

import 'package:flutter_weather/models/models.dart';
import 'package:flutter_weather/widgets/widgets.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key key,
    @required this.weather,
    @required this.color,
  }) : super(key: key);

  final WeatherModel weather;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        color: color,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(location: weather.location),
              ),
            ),
            Center(
              child: LastUpdated(dateTime: weather.lastUpdated),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                  weather: weather,
                ),
              ),
            ),
          ],
        ));
  }
}
