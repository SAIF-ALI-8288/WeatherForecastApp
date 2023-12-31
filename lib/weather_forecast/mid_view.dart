import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Util/forecast-util.dart';
import '../model/api.dart';
import 'convert_icon.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data?.list;
  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
  Container midView = Container(
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$city, $country",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            Text("${Util.getFormattedDate(formattedDate)}", style: TextStyle(
                fontSize: 15
            ),),

            SizedBox(
              height: 10,
            ),
            getWeatherIcon(weatherDescription: forecastList[0].weather![0].main
                , color: Colors.pinkAccent, size: 198),
            //Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pink,),
            //Icon(Icons.wb_sunny, size: 195,),
            Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${forecastList[0].main?.temp?.toStringAsFixed(0)}°F", style: TextStyle(
                    fontSize: 34,
                  ),),
                  Text("${forecastList[0].weather![0].description?.toUpperCase()}"),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric( horizontal: 12.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${forecastList[0].wind?.speed?.toStringAsFixed(1)} mi/h"),
                          Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                          //Icon(Icons.arrow_forward, size: 20, color: Colors.brown,)
                        ],
                      )
                  ),
                  Padding(padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${forecastList[0].main?.humidity?.toStringAsFixed(0)}%"),
                          //Icon(Icons.hot_tub, size: 20, color: Colors.brown,)
                          Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.brown,)
                        ],
                      )
                  ),

                  Padding(padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${forecastList[0].main?.tempMax?.toStringAsFixed(0)}°F"),
                          //Icon(Icons.wb_sunny, size: 20, color: Colors.brown,)
                          Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                        ],
                      ))


                ],
              ),
            ),


          ],
        ),
      ));
  return midView;
}