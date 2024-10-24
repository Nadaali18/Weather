class WeatherModel{
  final String cityName;
  final dynamic temp;
  final dynamic maxtemp;
  final dynamic mintemp;
  final dynamic sunrise;
  final dynamic sunset;
  final DateTime lastUpdated;
  final String condition;
  final String? image;
  final List<dynamic> forecastDays;
  WeatherModel({required this.condition, required  this.forecastDays,required this.image,required this.cityName, required this.temp, required this.maxtemp, required this.mintemp, required this.sunrise, required this.sunset, required this.lastUpdated});

 factory WeatherModel.fromJson(json){
    return WeatherModel(
      cityName: json['location']['name'], 
      temp: json['current']['temp_c'], 
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'], 
      mintemp:  json['forecast']['forecastday'][0]['day']['mintemp_c'], 
      sunrise: json['forecast']['forecastday'][0]['astro']['sunrise'], 
      sunset: json['forecast']['forecastday'][0]['astro']['sunset'], 
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      lastUpdated:DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      forecastDays: json['forecast']['forecastday'],
      );
  }
  String getDayName(String date) {
    DateTime dateTime = DateTime.parse(date);
    switch (dateTime.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

}