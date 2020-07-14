import 'dart:convert';

import 'package:flutter_weather/models/models.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_weather/blocs/weather/weather.dart';
import 'package:flutter_weather/repositories/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('weatherBlocTest', () {
    final weatherRepository = MockWeatherRepository();
    final weatherJson =
        '{"consolidated_weather":[{"created":"2020-07-13T21:21:23.257805Z","weather_state_name":"Light Cloud","weather_state_abbr":"lc","min_temp":20.38,"max_temp":26.43,"the_temp":26.73}],"title":"Chicago","location_type":"City","woeid":2379574,"latt_long":"41.884151,-87.632408","timezone":"US/Central"}';
    when(weatherRepository.getWeather('Chicago')).thenAnswer(
        (_) async => WeatherModel.fromJson(jsonDecode(weatherJson)));
    final today = DateTime(2020, 14, 7, 10, 12, 30);

    blocTest(
      'emits [] when nothing is added',
      build: () async =>
          WeatherBloc(WeatherInitial(), weatherRepository: weatherRepository),
      expect: [],
    );

    blocTest(
      'Weather requested',
      build: () async =>
          WeatherBloc(WeatherInitial(), weatherRepository: weatherRepository),
      act: (bloc) => bloc.add(WeatherRequested(city: 'Chicago')),
      expect: [
        WeatherLoadInProgress(),
        WeatherLoadSuccess(
            weather: WeatherModel(
          condition: WeatherCondition.lightCloud,
          formattedCondition: 'Light Cloud',
          minTemp: 20.38,
          maxTemp: 26.43,
          temp: 26.73,
          locationId: 2379574,
          created: '2020-07-13T21:21:23.257805Z',
          lastUpdated: today,
          // TODO Mock time
          location: 'Chicago',
        ))
      ],
    );
  });
}
