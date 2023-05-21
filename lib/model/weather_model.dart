import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/wi.dart';

class WeatherModel {
  final Widget icon;
  final String temperature;
  final String weekday;
  final String numericValue;

  WeatherModel(
      {required this.icon,
      required this.temperature,
      required this.weekday,
      required this.numericValue});
}

List<WeatherModel> weatherList = [
  WeatherModel(
      icon: const Iconify(MaterialSymbols.clear_day_rounded),
      temperature: '26\u2103',
      weekday: 'Sunday',
      numericValue: '10:00'),
  WeatherModel(
      icon: const Iconify(MaterialSymbols.weather_snowy_outline),
      temperature: '-5\u2103',
      weekday: 'Monday',
      numericValue: '12:10'),
  WeatherModel(
      icon: const Iconify(Wi.day_cloudy_windy),
      temperature: '12\u2103',
      weekday: 'Tuesday',
      numericValue: '13:10'),
  WeatherModel(
      icon: const Iconify(Mdi.weather_windy),
      temperature: '15\u2103',
      weekday: 'Wednesday',
      numericValue: '10:00'),
  WeatherModel(
      icon: const Iconify(MaterialSymbols.humidity_high),
      temperature: '20\u2103',
      weekday: 'Thursday',
      numericValue: '99:99'),
  WeatherModel(
      icon: const Iconify(MaterialSymbols.weather_snowy_outline),
      temperature: '-5\u2103',
      weekday: 'Monday',
      numericValue: '12:10'),
  WeatherModel(
      icon: const Iconify(MaterialSymbols.clear_day_rounded),
      temperature: '26\u2103',
      weekday: 'Sunday',
      numericValue: '10:00'),
  WeatherModel(
      icon: const Iconify(MaterialSymbols.clear_day_rounded),
      temperature: '26\u2103',
      weekday: 'Sunday',
      numericValue: '10:00'),
  WeatherModel(
      icon: const Iconify(MaterialSymbols.clear_day_rounded),
      temperature: '26\u2103',
      weekday: 'Sunday',
      numericValue: '10:00'),
  WeatherModel(
      icon: const Iconify(MaterialSymbols.clear_day_rounded),
      temperature: '26\u2103',
      weekday: 'Sunday',
      numericValue: '10:00'),
];
