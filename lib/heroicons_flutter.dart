library heroicons_flutter;

import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons.dart';

/// A Calculator.
class HeroiconsFlutter {
  static const IconData academicCap = _HeroiconsIconData(0xe804);

  static IconData fromString(String name) {
    final splitted = name.split(RegExp(r"[\s\-\_\.]"));

    String camelCaseString =
        splitted[0].substring(0, 1).toLowerCase() + splitted[0].substring(1);

    for (var i = 1; i < splitted.length; i++) {
      camelCaseString += splitted[i].substring(0, 1).toUpperCase() +
          splitted[i].substring(1).toLowerCase();
    }

    if (!heroiconsList.containsKey(camelCaseString)) {
      throw 'No heroicon with such name: $name';
    }

    return _HeroiconsIconData(heroiconsList[camelCaseString]!);
  }
}

class _HeroiconsIconData extends IconData {
  const _HeroiconsIconData(int code)
      : super(
          code,
          fontFamily: 'Heroicons Flutter',
          fontPackage: 'heroicons_flutter',
        );
}
