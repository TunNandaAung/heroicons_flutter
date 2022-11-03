library heroicons_flutter;

import 'package:flutter/material.dart';

/// A Calculator.
class HeroiconsFlutter {
  static const IconData academicCap = HeroiconsIconData(0xe804);
}

class HeroiconsIconData extends IconData {
  const HeroiconsIconData(int code)
      : super(
          code,
          fontFamily: 'Material Design Icons',
          fontPackage: 'material_design_icons_flutter',
        );
}
