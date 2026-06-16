# heroicons_flutter

<p align="center">
<img src="https://raw.githubusercontent.com/tunnandaaung/heroicons_flutter/main/example/assets/heroicons-cover.png" height="200" alt="Heroicons Cover" />
</p>

[Heroicons](https://heroicons.com) for Flutter.

## Icons List

All the available icons can be found at the
[official Heroicons website](https://heroicons.com) or at the demo site built
with this package.

## Usage

### Static icons (recommended)

Import the default library and use the icon classes directly:

```dart
import 'package:heroicons_flutter/heroicons_flutter.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          HeroiconsSolid.faceSmile,
          color: Colors.blue,
        ),
        const Icon(
          HeroiconsMini.banknotes,
          color: Colors.blue,
        ),
        const Icon(
          HeroiconsOutline.academicCap,
          color: Colors.blue,
        ),
      ],
    );
  }
}
```

Icon fonts are tree-shaken when you use static icons this way.

### String lookup (optional)

Resolve icons from a string at runtime with `named()` on the same class:

```dart
import 'package:heroicons_flutter/heroicons_flutter.dart';

Icon(HeroiconsOutline.named('academicCap'));
Icon(HeroiconsSolid.named('face_smile'));
```

`named()` accepts `camelCase`, `snake_case`, `kebab-case`, and
`dot.notation` strings.

### Deprecated `fromString()`

`HeroiconsOutline.fromString()` (and the same method on `HeroiconsSolid`,
`HeroiconsMini`, and `HeroiconsMicro`) is **deprecated**. Use `named()` instead:

```dart
// Deprecated
HeroiconsOutline.fromString('academicCap');

// Preferred
HeroiconsOutline.named('academicCap');
```

> [!WARNING]
> Tree shaking does not apply when `named()` is used. The lookup maps reference
> every icon for that style, so most font glyphs are kept.

## Regenerating icon code

Icon classes are generated from `lib/heroicons_list.dart`:

```bash
dart run tool/generate_heroicons.dart
```
