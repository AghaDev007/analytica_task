import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImageWidget extends StatelessWidget {
  String? image;
  double? width, height;
  BoxFit? fit;
  Color? color;

  SvgImageWidget(
      {this.image, this.height, this.width, this.fit, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        image.toString(),
        fit: fit ?? BoxFit.contain,
        color: color,
      ),
    );
  }
}
