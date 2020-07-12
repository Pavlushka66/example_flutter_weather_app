import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/blocs/blocs.dart';
import 'package:flutter_weather/models/models.dart';

void main() {
  group('themeBlocTest', () {
    blocTest(
      'emits [] when nothing is added',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      expect: [],
    );

    blocTest(
      'received clear weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) =>
          bloc.add(WeatherChanged(condition: WeatherCondition.clear)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.orangeAccent,
          ),
          color: Colors.yellow,
        )
      ],
    );

    blocTest(
      'received hail weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) => bloc.add(WeatherChanged(condition: WeatherCondition.hail)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
          ),
          color: Colors.lightBlue,
        )
      ],
    );

    blocTest(
      'received snow weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) => bloc.add(WeatherChanged(condition: WeatherCondition.snow)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
          ),
          color: Colors.lightBlue,
        )
      ],
    );

    blocTest(
      'received sleet weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) =>
          bloc.add(WeatherChanged(condition: WeatherCondition.sleet)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
          ),
          color: Colors.lightBlue,
        )
      ],
    );

    blocTest(
      'received heavyCloud weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) =>
          bloc.add(WeatherChanged(condition: WeatherCondition.heavyCloud)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.blueGrey,
          ),
          color: Colors.grey,
        )
      ],
    );

    blocTest(
      'received heavyRain weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) =>
          bloc.add(WeatherChanged(condition: WeatherCondition.heavyRain)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          color: Colors.indigo,
        )
      ],
    );

    blocTest(
      'received lightRain weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) =>
          bloc.add(WeatherChanged(condition: WeatherCondition.lightRain)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          color: Colors.indigo,
        )
      ],
    );

    blocTest(
      'received showers weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) =>
          bloc.add(WeatherChanged(condition: WeatherCondition.showers)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          color: Colors.indigo,
        )
      ],
    );

    blocTest(
      'received thunderstorm weather',
      build: () async => ThemeBloc(ThemeState(
        theme: ThemeData.light(),
        color: Colors.lightBlue,
      )),
      act: (bloc) =>
          bloc.add(WeatherChanged(condition: WeatherCondition.thunderstorm)),
      expect: [
        ThemeState(
          theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
          ),
          color: Colors.deepPurple,
        )
      ],
    );

    blocTest(
      'received unknown weather',
      build: () async => ThemeBloc(
          ThemeState(theme: ThemeData.dark(), color: Colors.deepPurple)),
      act: (bloc) =>
          bloc.add(WeatherChanged(condition: WeatherCondition.unknown)),
      expect: [
        ThemeState(
          theme: ThemeData.light(),
          color: Colors.lightBlue,
        )
      ],
    );
  });
}
