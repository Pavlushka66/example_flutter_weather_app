import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/blocs/settings/settings.dart';

void main() {
  group('settingsBlocTest', () {
    blocTest(
      'emits [] when nothing is added',
      build: () async => SettingsBloc(
          SettingsState(temperatureUnits: TemperatureUnits.celsius)),
      expect: [],
    );

    blocTest(
      'toggle from celsius to fahrenheit',
      build: () async => SettingsBloc(
          SettingsState(temperatureUnits: TemperatureUnits.celsius)),
      act: (bloc) => bloc.add(TemperatureUnitsToggled()),
      expect: [SettingsState(temperatureUnits: TemperatureUnits.fahrenheit)],
    );

    blocTest(
      'toggle from fahrenheit to celsius',
      build: () async => SettingsBloc(
          SettingsState(temperatureUnits: TemperatureUnits.celsius)),
      act: (bloc) => bloc.add(TemperatureUnitsToggled()),
      expect: [SettingsState(temperatureUnits: TemperatureUnits.fahrenheit)],
    );
  });
}
