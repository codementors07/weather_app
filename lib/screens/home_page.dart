import 'package:flutter/material.dart';
import 'package:weather_app/config/custom_textstyles.dart';

import '../model/weather_model.dart';
import '../widget/custom_drawer_widget.dart';

import '../widget/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomepageWidgets homepageWidgets = HomepageWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const CustomDrawerWidget(),
      body: CustomScrollView(
        slivers: [
          homepageWidgets.createSliverAppbar(),
          SliverList(
              delegate: SliverChildListDelegate([
            homepageWidgets.createCustomContainer(),

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
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '${weatherList.length} days',
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
                  )
                ],
              ),
            ),

            // SizedBox(
            //   height: 100,
            //   child: ListView.builder(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //     shrinkWrap: true,
            //     primary: false,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: weatherList.length,
            //     itemBuilder: (context, index) {
            //       var weatherDatas = weatherList[index];
            //       return Row(
            //         children: [
            // Text(
            //   weatherDatas.temperature,
            //   style: CustomTextStyles.largeTextStyle(fontSize: 12),
            // ),
            // const SizedBox(
            //   width: 10,
            // ),
            // Text(
            //   weatherDatas.weekday,
            //   style: CustomTextStyles.largeTextStyle(fontSize: 12),
            // ),
            // const SizedBox(
            //   width: 10,
            // ),
            // Text(
            //   weatherDatas.numericValue,
            //   style: CustomTextStyles.largeTextStyle(fontSize: 12),
            // ),
            //         ],
            //       );
            //     },
            //   ),
            // ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: weatherList
                    .map((weatherDatas) => Column(
                          children: [
                            Text(
                              weatherDatas.temperature,
                              style:
                                  CustomTextStyles.largeTextStyle(fontSize: 12),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              weatherDatas.weekday,
                              style:
                                  CustomTextStyles.largeTextStyle(fontSize: 12),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              weatherDatas.numericValue,
                              style:
                                  CustomTextStyles.largeTextStyle(fontSize: 12),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),

            // const Text('data')
          ]))
        ],
      ),
    );
  }
}
