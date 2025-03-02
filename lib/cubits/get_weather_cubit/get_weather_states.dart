import 'package:weather_app/models/weather_model.dart';

class WeatherState{}
class NoWeatherState extends WeatherState{}
class WeatherFailureState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
    
    final WeatherModel weatherModel;
    WeatherLoadedState(this.weatherModel);

}

