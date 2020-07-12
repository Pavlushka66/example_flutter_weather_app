import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_weather/repositories/repositories.dart';
import 'package:flutter_weather/models/models.dart';

import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(WeatherState initialState, {@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final WeatherModel weather =
            await weatherRepository.getWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}
