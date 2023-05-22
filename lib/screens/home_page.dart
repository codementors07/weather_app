import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/config/custom_textstyles.dart';

import '../model/weather_model.dart';
import '../widget/custom_drawer_widget.dart';

import '../widget/home_page_widgets.dart';
import 'description_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomepageWidgets homepageWidgets = HomepageWidgets();

  int? index;

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
            // if (index != null)

            homepageWidgets.createCustomContainer(
                model: weatherList[index ?? 0]),
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
                                    weatherModel: weatherList[index ?? 0],
                                  )));
                    },
                    child: Wrap(
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
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 165,
              child: weatherList.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherList.length,
                      itemBuilder: (context, ind) {
                        var weatherDatas = weatherList[ind];
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
                                  weatherDatas.temperature,
                                  style: CustomTextStyles.semilargeTextStyle(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.network(
                                  weatherDatas.networkImage,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  DateFormat('hh : mm')
                                      .format(weatherDatas.dateTime),
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
