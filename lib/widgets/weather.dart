import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_weather/widgets/widgets.dart';
import 'package:flutter_weather/blocs/blocs.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherController();
}

class _WeatherController extends State<Weather> {
  WeatherBloc weatherBloc;
  ThemeBloc themeBloc;

  @override
  Widget build(BuildContext context) {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    themeBloc = BlocProvider.of<ThemeBloc>(context);
    return _WeatherView(this);
  }

  @override
  void dispose() {
    weatherBloc.close();
    themeBloc.close();
    weatherBloc = null;
    themeBloc = null;

    super.dispose();
  }

  void handleCitySelection() async {
    final city = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CitySelection(),
      ),
    );
    if (city != null) {
      weatherBloc.add(WeatherRequested(city: city));
    }
  }

  void handleOpenSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Settings(),
      ),
    );
  }

  Widget buildWeatherBloc() {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoadSuccess) {
          themeBloc.add(
            WeatherChanged(condition: state.weather.condition),
          );
        }
      },
      builder: (context, state) {
        if (state is WeatherInitial) {
          return Center(
              child:
                  Text('Please Select a Location')); // TODO: Move to resources
        }
        if (state is WeatherLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is WeatherLoadSuccess) {
          final weather = state.weather;

          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return WeatherInfo(weather: weather, color: themeState.color);
            },
          );
        }
        return Text(
          'Something went wrong!', // TODO: Move to resources
          style: TextStyle(color: Colors.red),
        );
      },
    );
  }
}

class _WeatherView extends StatelessWidget {
  final _WeatherController state;

  const _WeatherView(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'), // TODO: Move to resources
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: state.handleOpenSettings,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: state.handleCitySelection,
          )
        ],
      ),
      body: Center(
        child: state.buildWeatherBloc(),
      ),
    );
  }
}
