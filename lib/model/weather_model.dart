


class WeatherModel{
final String locationName;
final String region;
final String country;
final String conditionText;
final String conditionIcon;
final double temperatureC;
final String localTime;


WeatherModel({required this.locationName,required this.conditionIcon,required this.conditionText,required this.country,required this.localTime,required this.region,required this.temperatureC});

factory WeatherModel.fromJson(Map<String,dynamic>json ){
  return WeatherModel(
      locationName: json["location"]["name"],
      conditionIcon: json["current"]["condition"]["icon"],
      conditionText: json["current"]["condition"]["text"],
      country: json["location"]["country"],
      localTime: json["location"]["localtime"],
      region: json["location"]["region"],
      temperatureC: json["current"]["temp_c"],
  );
}
}