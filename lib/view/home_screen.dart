import 'package:api_http/controller/cubit.dart';
import 'package:api_http/controller/states.dart';
import 'package:api_http/model/local/weather_model.dart';
import 'package:api_http/view/search_screen.dart';
import 'package:api_http/widget/get_weather.dart';
import 'package:api_http/widget/no_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherModel? model = WeatherCubit.get(context).model;
          if (state is WeatherSuccessState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: model!.getThemeColor(),
                title: const Text('New Weather'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Search();
                        }));
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              body: const WeatherInfoBody(),
            );
          } else if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              body: const NoWeatherBody(),
              appBar: AppBar(
                backgroundColor: Colors.blue,
                // model!.getThemeColor() ??
                title: const Text('New Weather'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Search();
                        }));
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
            );
          }
        });
  }
}
