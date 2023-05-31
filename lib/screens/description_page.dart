import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/config/custom_textstyles.dart';
import 'package:weather_app/widget/home_page_widgets.dart';

import '../model/weather_model_new.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage(
      {super.key, required this.weatherModel, required this.index});

  final WeatherModelNew? weatherModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          HomepageWidgets().createSliverAppbar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  )),
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.white,
              ),
              title: '7 days',
              action: const Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 34,
              )),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.fromLTRB(23, 0, 23, 50),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(80),
                                    bottomRight: Radius.circular(80),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        // spreadRadius: 2.5,
                                        blurRadius: 20,
                                        color: Colors.blue)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headerPart(weatherModel, index),
                                  HomepageWidgets()
                                      .createDividerAndRowOfIconAndText(
                                          weatherModel: weatherModel,
                                          index: index),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 23, vertical: 20),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: weatherModel?.list?.length,
                              itemBuilder: (context, index) {
                                var weatherDatas = weatherModel?.list?[index];

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat('EEE').format(
                                        DateTime.parse(weatherDatas?.dtTxt ??
                                            DateTime.now().toString()),
                                      ),
                                      style:
                                          CustomTextStyles.semilargeTextStyle(
                                              fontSize: 18,
                                              textColor: Colors.grey,
                                              fontWeight: FontWeight.normal),
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      children: [
                                        Image.network(
                                          'http://openweathermap.org/img/w/${weatherDatas?.weather?.first.icon}.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          weatherDatas?.weather?.first.main ??
                                              'Sunny',
                                          style: CustomTextStyles
                                              .semilargeTextStyle(
                                                  fontSize: 18,
                                                  textColor: Colors.grey,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      weatherDatas?.main?.temp.toString() ??
                                          '88',
                                      style:
                                          CustomTextStyles.semilargeTextStyle(
                                              fontSize: 18,
                                              textColor: Colors.grey,
                                              fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                );
                              })
                        ],
                      ),
                  childCount: 1))
        ],
      ),
    );
  }

  Widget headerPart(WeatherModelNew? weatherModel, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Image.network(
              'http://openweathermap.org/img/w/${weatherModel?.list?[index].weather?.first.icon}.png',
              height: 150,
              width: 150,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tomorrow',
                    style: CustomTextStyles.largeTextStyle(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    weatherModel?.list?[index].main?.temp.toString() ?? '76',
                    style: CustomTextStyles.customTextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    weatherModel?.list?[index].weather?.first.main ?? 'sunny',
                    style: CustomTextStyles.semilargeTextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
