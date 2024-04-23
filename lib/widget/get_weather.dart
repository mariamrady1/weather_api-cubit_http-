import 'package:api_http/controller/cubit.dart';
import 'package:api_http/controller/states.dart';
import 'package:api_http/model/local/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        WeatherModel? model = WeatherCubit.get(context).model;
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                model!.getThemeColor(),
                model.getThemeColor()[300]!,
                model.getThemeColor()[100]!,
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${model.cityName}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Text(
                'Updated at ${model.date!.split(' ')[1]}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 80,
                      child: Image.asset(
                        model.getImage(),
                        fit: BoxFit.fill,
                      )),
                  Text(
                    '${model.temp}°C',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Max: ${model.maxTemp}°C',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Min: ${model.minTemp}°C',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 50),
              Text(
                "${model.weatherCondition}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              )
            ],
          ),
        );
      },
    );
  }
}
