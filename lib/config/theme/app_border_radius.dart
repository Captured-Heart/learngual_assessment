import 'package:flutter/painting.dart';

class AppBorderRadius {
  AppBorderRadius._();

  static const BorderRadius c2 = BorderRadius.all(Radius.circular(2));
  static const BorderRadius c4 = BorderRadius.all(Radius.circular(4));
  static const BorderRadius c6 = BorderRadius.all(Radius.circular(6));
  static const BorderRadius c8 = BorderRadius.all(Radius.circular(8));
  static const BorderRadius c12 = BorderRadius.all(Radius.circular(12));
  static const BorderRadius c16 = BorderRadius.all(Radius.circular(16));
}

class AppEdgeInsets {
  AppEdgeInsets._();

  static const EdgeInsets eA4 = EdgeInsets.all(4);
  static const EdgeInsets eA8 = EdgeInsets.all(8);
  static const EdgeInsets eA12 = EdgeInsets.all(12);
  static const EdgeInsets eA16 = EdgeInsets.all(16);
  static const EdgeInsets eA20 = EdgeInsets.all(20);

  static const EdgeInsets eH4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets eH8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets eH12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets eH16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets eH20 = EdgeInsets.symmetric(horizontal: 20);

  static const EdgeInsets eV4 = EdgeInsets.symmetric(vertical: 4);
  static const EdgeInsets eV8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets eV12 = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets eV16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets eV20 = EdgeInsets.symmetric(vertical: 20);
}
