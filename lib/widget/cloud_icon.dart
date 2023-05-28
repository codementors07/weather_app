import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget cloudIcon({
  double? bottom,
  double? left,
  double? right,
  double? top,
  double? bottom2,
  double? left2,
  double? right2,
  double? top2,
  double? height,
  double? width,
}) {
  return Stack(
    children: [
      Positioned(
          top: top,
          left: left,
          bottom: bottom,
          right: right,
          child: SvgPicture.network(
            'https://www.svgimages.com/svg-image/s7/cloud.svg',
            height: height ?? 40,
            width: width ?? 40,
          )),
      Positioned(
          top: top2,
          left: left2,
          bottom: bottom2,
          right: right2,
          child: SvgPicture.network(
            'https://www.svgimages.com/svg-image/s7/cloud.svg',
            height: height ?? 40,
            width: width ?? 40,
          ))
    ],
  );
}
