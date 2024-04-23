class AppLinks {
  ////https://api.weatherapi.com/
  // v1/forecast.json
  // ?key=3677bed892474b30b7a122242220806&q=egypt&days=7

  static const String baserUrl = "https://api.weatherapi.com/";
  static const String apikey = "3677bed892474b30b7a122242220806";

  static const url = "${baserUrl}v1/forecast.json";

  static String postWeather(String cityName) {
    return "$url?key=$apikey&q=$cityName&days=7";
  }
}
