import 'package:flutter/material.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {}

class WeatherErrorState extends WeatherState {
  final String error;
  WeatherErrorState(this.error);
}
