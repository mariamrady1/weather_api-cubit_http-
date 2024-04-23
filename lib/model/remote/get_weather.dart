import '../../core/class/app_linkes.dart';
import '../../core/class/curd.dart';

class GetWeatherRemoteData {
  Curd curd;
  GetWeatherRemoteData(this.curd);

  getWeather({
    required String cityName,
  }) async {
    final response = await curd.get(AppLinks.postWeather(cityName));
    return response.fold((l) => l, (r) => r);
  }
}
