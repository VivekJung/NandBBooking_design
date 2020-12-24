import 'package:flutter/material.dart';

class Services {
  String serviceName;
  String serviceCategory;
  String serviceImg;
  double servicePrice;

  Services(
      {@required this.serviceName,
      @required this.serviceCategory,
      @required this.serviceImg,
      @required this.servicePrice});
}
