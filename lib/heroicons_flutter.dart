library heroicons_flutter;

import 'package:flutter/material.dart';
import 'package:heroicons_flutter/helpers.dart';
import 'package:heroicons_flutter/heroicons_list.dart';

/// A Calculator.
class HeroiconsSolid {
  static const IconData academicCap = _HeroiconsSolidIconData(0xe804);

  static IconData fromString(String name) {
    final camelCaseString = toCamelCase(name);

    if (!heroiconsSolidList.containsKey(camelCaseString)) {
      throw 'No heroicon with such name: $name';
    }

    return _HeroiconsSolidIconData(heroiconsSolidList[camelCaseString]!);
  }
}

class HeroiconsOutline {
  static const IconData academicCap = _HeroiconsOutlineIconData(0xe802);

  static IconData fromString(String name) {
    final camelCaseString = toCamelCase(name);

    if (!heroiconsOutlineList.containsKey(camelCaseString)) {
      throw 'No heroicon with such name: $name';
    }

    return _HeroiconsOutlineIconData(heroiconsOutlineList[camelCaseString]!);
  }
}

class _HeroiconsSolidIconData extends IconData {
  const _HeroiconsSolidIconData(int code)
      : super(
          code,
          fontFamily: 'Heroicons Solid',
          fontPackage: 'heroicons_flutter',
        );
}

class _HeroiconsOutlineIconData extends IconData {
  const _HeroiconsOutlineIconData(int code)
      : super(
          code,
          fontFamily: 'Heroicons Outline',
          fontPackage: 'heroicons_flutter',
        );
}
