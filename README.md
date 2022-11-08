# heroicons_flutter

<p align="center">
<img src="./example/assets/heroicons-cover.png" height="100%" width="100%" alt="Heroicons Cover" />
</p>

[Heroicons](https://heroicons.com) from [Tailwind Labs](https://github.com/tailwindlabs) as Flutter icons set. See the demo [here](https://heroicons-flutter.vercel.app).

## Icons List

All the available icons can be found at the [official Heroicons website](https://heroicons.com) or at the [demo site](https://heroicons-flutter.vercel.app) built with this package.

## Usage

All the available Heroicons can be used as Flutter icon as  shown below.

```dart
import 'package:heroicons_flutter/heroicons_flutter.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        const Icon(
          // Solid Icon
          HeroiconsSolid.faceSmile,
          color: Colors.blue,
        ),
        const Icon(
          // Mini Icon
          HeroiconsMini.banknotes,
          color: Colors.blue,
        ),
        Icon(
          // Outline Icon
          HeroiconsOutline.academicCap,
          color: Colors.blue,
        )
      ],
    );
  }
}
```

You can also use the icon by passing the string icon names to the `fromString()` method as below.

```dart
// camelCase
HericonsOutline.fromString("academicCap")
```

`fromString()` method also accepts `snake_case`, `kebab-case` and `dot.notation` strings.
