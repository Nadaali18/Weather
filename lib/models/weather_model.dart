class WeatherModel{
  final String cityName;
  final dynamic temp;
  final dynamic maxtemp;
  final dynamic mintemp;
  final dynamic uv;
  final dynamic sunrise;
  final dynamic sunset;
  final String condition;
  final String lastUpdated;

  WeatherModel({required this.cityName, required this.temp, required this.maxtemp, required this.mintemp, required this.uv, required this.sunrise, required this.sunset, required this.condition, required this.lastUpdated});

 factory WeatherModel.fromJson(json){
    return WeatherModel(
      cityName: json['location']['name'], 
      temp: json['current']['temp_c'], 
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'], 
      mintemp:  json['forecast']['forecastday'][0]['day']['mintemp_c'], 
      uv: json['forecast']['forecastday'][0]['day']['uv'], 
      sunrise: json['forecast']['forecastday'][0]['astro']['sunrise'], 
      sunset: json['forecast']['forecastday'][0]['astro']['sunset'], 
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'], 
      lastUpdated: json['current']['last_updated'],
      );
  }

}