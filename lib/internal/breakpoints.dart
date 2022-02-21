// Flutter imports:
import 'package:flutter/material.dart';

class FormFactor {
  static double desktop = 1200;
  static double tablet = 600;
  static double handset = 300;
}

bool isDesktop(context) =>
    MediaQuery.of(context).size.width >= FormFactor.desktop;

bool isTablet(context) =>
    MediaQuery.of(context).size.width >= FormFactor.tablet ||
    MediaQuery.of(context).size.width < FormFactor.desktop;

bool isHandset(context) =>
    MediaQuery.of(context).size.width < FormFactor.tablet;
