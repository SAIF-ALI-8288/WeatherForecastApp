import 'dart:convert';

import 'package:weatherforecast/Util/forecast-util.dart';

import '../model/api.dart';

class Network {
  Future<WeatherForecastModel> getweatherForecast({required String cityName})async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=" +
        cityName +
        "&appid=" +
        Util.appid +
        "&units=imperial";
    final response=await get(Uri.encodeFull(finalUrl));
    print("URL:${Uri.encodeFull(finalUrl)}");
    if(response.statusCode==200){
      print("Weather data ${response.body}");
      return WeatherForecastModel.fromJson(json.encode(response.body) as Map<String, dynamic>);
    }else{
      throw Exception("Error occur in weatherforecast");
    }
  }
  }

  get(String encodeFull) {}

