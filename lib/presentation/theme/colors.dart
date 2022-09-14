import 'package:flutter/material.dart';

abstract class AppColor {
  Color get background;
  Color get onBackground;
  Color get primary;
  Color get primaryContainer;
  Color get onPrimary;
  Color get secondary;
  Color get secondaryContainer;
  Color get onSecondary;
  Color get surface;
  Color get onSurface;
  Color get error;
  Color get onError;
  Brightness get brightness;
}

class LightColor implements AppColor {
  @override
  Color get background => const Color.fromRGBO(232, 249, 253, 1);
  @override
  Color get onBackground => Colors.black;
  @override
  Color get primary => const Color.fromRGBO(33, 85, 205, 1);
  @override
  Color get primaryContainer => const Color.fromARGB(255, 16, 41, 100);
  @override
  Color get onPrimary => Colors.white;
  @override
  Color get secondary => const Color.fromRGBO(121, 218, 232, 1);
  @override
  Color get secondaryContainer => const Color.fromARGB(255, 54, 130, 142);
  @override
  Color get onSecondary => Colors.white;
  @override
  Color get surface => Colors.white;
  @override
  Color get onSurface => Colors.black;
  @override
  Color get error => Colors.red.shade900;
  @override
  Color get onError => Colors.white;
  @override
  Brightness get brightness => Brightness.light;
}

class DarkColor implements AppColor {
  @override
  Color get background => const Color.fromRGBO(43, 72, 101, 1);
  @override
  Color get onBackground => Colors.white;
  @override
  Color get primary => const Color.fromRGBO(0, 43, 91, 1);
  @override
  Color get primaryContainer => const Color.fromARGB(255, 16, 78, 148);
  @override
  Color get onPrimary => Colors.white;
  @override
  Color get secondary => const Color.fromRGBO(143, 227, 207, 1);
  @override
  Color get secondaryContainer => const Color.fromARGB(255, 75, 114, 105);
  @override
  Color get onSecondary => Colors.white;
  @override
  Color get surface => Colors.black38;
  @override
  Color get onSurface => Colors.white;
  @override
  Color get error => Colors.red.shade400;
  @override
  Color get onError => Colors.white;
  @override
  Brightness get brightness => Brightness.dark;
}
