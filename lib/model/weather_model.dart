class WeatherModel {
  final int id;

  final String temperature;
  final DateTime dateTime;
  final String networkImage;
  final String weatherType;

  WeatherModel(
      {required this.id,
      required this.networkImage,
      required this.temperature,
      required this.dateTime,
      required this.weatherType});
}

List<WeatherModel> weatherList = [
  WeatherModel(
    id: 1,
    networkImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtLVyuZjyvYjumLJLSLVeCuQf0uxiAjbNX5c-JGr10dA&s',
    temperature: '27 \u2103',
    dateTime: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 08, 55),
    weatherType: 'Thunderstorm',
  ),
  WeatherModel(
    id: 2,
    networkImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFBDhvq6beDSOg19H8UQV2l30Im9_OE6y--59EuEeb6Q&s',
    temperature: '9 \u2103',
    dateTime: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 12, 12),
    weatherType: 'Sunny',
  ),
  WeatherModel(
    id: 3,
    networkImage:
        'https://freepngimg.com/thumb/weather/23648-2-weather-picture-thumb.png',
    temperature: '-10 \u2103',
    dateTime: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 2, 16, 30),
    weatherType: 'Rainy',
  ),
  WeatherModel(
    id: 4,
    networkImage:
        'https://freepngimg.com/thumb/weather/23722-3-weather-image-thumb.png',
    temperature: '1 \u2103',
    dateTime: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 3, 21, 33),
    weatherType: 'Snow Fall',
  ),
  WeatherModel(
    id: 5,
    networkImage: 'https://freepngimg.com/thumb/categories/2275.png',
    temperature: '42 \u2103',
    dateTime: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 4, 23, 23),
    weatherType: 'Windy',
  ),
];
