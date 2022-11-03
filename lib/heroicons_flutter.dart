library heroicons_flutter;

import 'package:flutter/material.dart';

/// A Calculator.
class HeroiconsFlutter {
  static const IconData academicCap = _HeroiconsIconData(0xe804);
}

class _HeroiconsIconData extends IconData {
  const _HeroiconsIconData(int code)
      : super(
          code,
          fontFamily: 'Heroicons Flutter',
          fontPackage: 'heroicons_flutter',
        );
}
