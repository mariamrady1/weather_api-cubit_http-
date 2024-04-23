import 'package:api_http/controller/cubit.dart';
import 'package:api_http/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  // GlobalKey to uniquely identify the Form widget
  final GlobalKey<FormState> _formKey = GlobalKey();

  // TextEditingController to control the text field's input
  final TextEditingController _textEditingController = TextEditingController();

  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // You can add listener logic here if needed
      },
      builder: (context, state) {
        // Access the ApiCubit instance from the context
        WeatherCubit controller = WeatherCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Search'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text field for entering city name
                    TextFormField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Enter city name',
                        prefixIcon: Icon(Icons.search),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a city name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Button to submit search query
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.getWeather(_textEditingController.text);
                          Navigator.pop(context); // Close the search screen
                        }
                      },
                      child: const Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
