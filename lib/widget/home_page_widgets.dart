import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model_new.dart';

import '../config/asset_images.dart';
import '../config/custom_textstyles.dart';

class HomepageWidgets {
  SliverAppBar createSliverAppbar(
      {Icon? icon, String? title, Widget? leading, Widget? action}) {
    return SliverAppBar(
      // its an appbar but has more properties
      // snap: true,
      // floating: true, // appbar adkaidincha
      elevation: 0,
      pinned: true,
      shadowColor: Colors.transparent,
      title: RichText(
          text: WidgetSpan(
              child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        // row and column duitai ko property access garna milcha
        children: [
          icon ??
              const Icon(
                Icons.pin_drop_outlined,
                color: Colors.white,
              ),
          Text(title ?? '')
        ],
      ))),
      leading: leading ??
          Builder(builder: (context) {
            return InkWell(
              onTap: () {
                print('pressed on tap ');

                Scaffold.of(context).openDrawer();
              },
              child: const Iconify(
                Bx.menu_alt_left,
                color: Colors.white,
              ),
            );
          }),
      actions: [action ?? const SizedBox()],
    );
  }

  Container createCustomContainer(
      {required WeatherModelNew? model, required int index}) {
    return Container(
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
        children: [
          const SizedBox(
            height: 40,
          ),
          Image.network(
            'http://openweathermap.org/img/w/${model?.list?[index].weather?.first.icon}.png',
            height: 200,
            width: 200,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                AssetPath.logo,
                height: 200,
                width: 200,
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model?.list?[index].main?.temp.toString() ?? 'null data',
            style: CustomTextStyles.largeTextStyle(
                fontSize: 55, textDecoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            model?.list?[index].weather?.first.main ?? 'Sunny',
            style: CustomTextStyles.largeTextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                textDecoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            DateFormat('EEEE, dd MMM').format(DateTime.parse(
                model?.list?[index].dtTxt ?? DateTime.now().toString())),
            style:
                // Theme.of(context).textTheme.labelSmall,

                CustomTextStyles.largeTextStyle(
                    fontSize: 14, fontWeight: FontWeight.w300),
          ),
          createDividerAndRowOfIconAndText(weatherModel: model, index: index),
        ],
      ),
    );
  }

  Widget createDividerAndRowOfIconAndText(
      {required WeatherModelNew? weatherModel, required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.white,
          thickness: 0.15,
          // height: .25,
          indent: 10,
          endIndent: 10,
          // thickness: 1,
          // height: .75,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            createCustomIconAndText(
                iconData: Icons.wind_power,
                text: '${weatherModel?.list?[index].wind?.speed} km/h',
                type: 'Windy'),
            createCustomIconAndText(
                iconData: Icons.water_drop_outlined,
                text: '${weatherModel?.list?[index].main?.humidity} \u2103',
                type: 'Humid'),
            createCustomIconAndText(
                iconData: Icons.cloud,
                text: '${weatherModel?.list?[index].clouds?.all} ',
                type: 'Cloudy'),
          ],
        ),
      ],
    );
  }

  Column createCustomIconAndText({
    required IconData iconData,
    required String text,
    required String type,
  }) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 30,
          color: Colors.white,
          weight: 5,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: CustomTextStyles.largeTextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          type,
          style: CustomTextStyles.largeTextStyle(
              fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
