## 0.5.0

### Breaking changes

- Replace custom `IconData` subclasses with plain `IconData` for compatibility
  with Flutter's `final` `IconData` class.
- Deprecate `HeroiconsOutline.fromString()` (and the same method on
  `HeroiconsSolid`, `HeroiconsMini`, and `HeroiconsMicro`). Use `named()`
  instead.

### Added

- Add `HeroiconsOutline.named()` (and the same method on `HeroiconsSolid`,
  `HeroiconsMini`, and `HeroiconsMicro`) for runtime string lookup.
- Add `tool/generate_heroicons.dart` to generate `lib/heroicons_flutter.dart`
  from `lib/heroicons_list.dart`.

### Changed

- Generate icon classes from `heroicons_list.dart` instead of maintaining
  `heroicons_flutter.dart` by hand.
- Use const lookup maps for string resolution so release builds pass icon font
  tree shaking without non-const `IconData` construction errors.

### Migration

```dart
// Before
HeroiconsOutline.fromString('academicCap');

// After
HeroiconsOutline.named('academicCap');
```

## 0.4.0

- Add micro icons
- Update to Heroicons v2.1.5

## 0.3.0

- Update dependencies and SDK version
- Add a note about using the `fromString()` method in the documentation

## 0.2.3

- Update docs

## 0.2.2

- Initial Release
