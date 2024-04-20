class APIEndpoints {
  static weather(String cityName) =>
      "http://api.openweathermap.org/data/2.5/find?q=$cityName&appid=01133953654bb3409bbedcb028520754&units=metric";
}
