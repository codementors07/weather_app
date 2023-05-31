import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/config/custom_textstyles.dart';

import '../model/weather_model_new.dart';
import '../widget/custom_drawer_widget.dart';

import '../widget/home_page_widgets.dart';
import 'api_page.dart';
import 'description_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomepageWidgets homepageWidgets = HomepageWidgets();
  int? index;

  Dio dio = Dio();

  WeatherModelNew? weatherModelNew;
  List<ListElement> todaysList = [];

  Future<WeatherModelNew> getWeatherDatas() async {
    const String mainUrl = 'https://api.openweathermap.org';
    const String endpoint = '/data/2.5/forecast';

    try {
      final response = await dio.get('$mainUrl$endpoint', queryParameters: {
        "lat": 27.7172,
        "lon": 85.3240,
        "appid": "3961a8edb095591f19de8fb19990e859",
      });

      return WeatherModelNew.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future fetchWeatherDatasFromApi() async {
    final allWeatherDatas = await getWeatherDatas();

    setState(() {
      weatherModelNew = allWeatherDatas;
      todaysList = allWeatherDatas.list!
          .where((listElement) =>
              DateFormat('yyyy-MM-dd').format(DateTime.parse(
                  listElement.dtTxt ?? DateTime.now().toString())) ==
              DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(DateTime.now().toString())))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherDatasFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const CustomDrawerWidget(),
      body: CustomScrollView(
        slivers: [
          homepageWidgets.createSliverAppbar(
              action: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ApiPage()));
                },
                child: const Icon(
                  Icons.skip_next,
                  color: Colors.white,
                  size: 44,
                ),
              ),
              title: weatherModelNew?.city?.name),
          SliverList(
              delegate: SliverChildListDelegate([
            // if (index != null)

            homepageWidgets.createCustomContainer(
                model: weatherModelNew, index: index ?? 0),
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: CustomTextStyles.largeTextStyle(fontSize: 24),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DescriptionPage(
                                    weatherModel: weatherModelNew,
                                    index: index ?? 0,
                                  )));
                    },
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '${todaysList.length} weather',
                          style: CustomTextStyles.largeTextStyle(
                              fontSize: 16, textColor: Colors.grey),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 165,
              child:
                  // weatherModelNew?.list!.isEmpty
                  //     ? const CircularProgressIndicator()
                  //     :
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: todaysList.length,
                      itemBuilder: (context, ind) {
                        var weatherDatas = todaysList[ind];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              index = ind;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 7.5),
                            padding: EdgeInsets.symmetric(
                                horizontal: index == ind ? 25 : 15,
                                vertical: index == ind ? 20 : 10),
                            decoration: BoxDecoration(
                                color: index == ind ? Colors.blue : null,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  weatherDatas.main?.temp.toString() ??
                                      'ajsajs',
                                  style: CustomTextStyles.semilargeTextStyle(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.network(
                                  'http://openweathermap.org/img/w/${weatherDatas.weather?.first.icon}.png',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  DateFormat('hh : mm').format(DateTime.parse(
                                      weatherDatas.dtTxt ??
                                          DateTime.now().toString())),
                                  style: CustomTextStyles.semilargeTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
            ),

            const SizedBox(
              height: 15,
            ),
          ]))
        ],
      ),
    );
  }
}
