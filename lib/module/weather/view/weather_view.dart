import 'package:flutter/material.dart';
import 'package:weather_app/module/weather/controller/weather_bloc.dart';
import 'package:weather_app/module/weather/model/weather_model.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  TextEditingController textEditingController = TextEditingController();
  WeatherBloc weatherBloc = WeatherBloc();

  @override
  void dispose() {
    weatherBloc.dispose();
    super.dispose();
  }

  void fetchWeatherData() {
    String location = textEditingController.text;
    if (location.isNotEmpty) {
      weatherBloc.fetchWeatherData(location);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'City Name is Empty',
            style: TextStyle(fontSize: 16),
          ),
          dismissDirection: DismissDirection.startToEnd,
          closeIconColor: Colors.white,
          showCloseIcon: true,
          duration: Duration(seconds: 3),
          hitTestBehavior: HitTestBehavior.translucent,
          elevation: 0.0,
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Please Enter City Name",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: "Enter location",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              onPressed: () {
                fetchWeatherData();
                textEditingController.clear();
              },
              child: const Text("Get Weather"),
            ),
          ),
          const SizedBox(height: 40),
          StreamBuilder<WeatherDTO>(
            stream: weatherBloc.getWeatherData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: snapshot.data!.weatherDescription.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textAlign: TextAlign.left,
                                  "City Name: ${snapshot.data!.weatherDescription[0].name}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "Latitude: ${snapshot.data!.weatherDescription[0].coord.latitude}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "Longitude: ${snapshot.data!.weatherDescription[0].coord.latitude}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "Temperature: ${snapshot.data!.weatherDescription[0].main.temp}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "Feels Like : ${snapshot.data!.weatherDescription[0].main.feelsLike}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "High Temperature : ${snapshot.data!.weatherDescription[0].main.tempMax}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "Minimum Temperature : ${snapshot.data!.weatherDescription[0].main.tempMin}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "Pressure : ${snapshot.data!.weatherDescription[0].main.pressure}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  "Humidity: ${snapshot.data!.weatherDescription[0].main.humidity}",
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            )
                          : const Text("Data Not Available"),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Text("");
                  }
                default:
                  return const Text("");
              }
            },
          ),
        ],
      ),
    );
  }
}
