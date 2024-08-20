import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String? image;
  double? width, height;
  BoxFit? fit;
  Color? color;

  ImageWidget(
      {this.image, this.fit, this.height, this.width, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        image.toString(),
        color: color,
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}

class NetworkImageWidget extends StatelessWidget {
  String? image;
  double? width, height;
  BoxFit? fit;
  Color? color;

  NetworkImageWidget(
      {this.image, this.fit, this.height, this.width, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        image.toString(),
        color: color,
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}
