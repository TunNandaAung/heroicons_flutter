import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class StickyHeaderInput extends SliverPersistentHeaderDelegate {
  final double size;
  final void Function(String) onInputChanged;

  StickyHeaderInput({required this.size, required this.onInputChanged});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      height: size,
      child: Center(
        child: TextFormField(
          autofocus: false,
          onChanged: (val) => onInputChanged(val),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 1.0,
                color: Colors.grey.shade200,
              ),
            ),
            prefixIcon: const Icon(HeroiconsSolid.academicCap),
            prefixIconColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.focused)) {
                return const Color(0xFF8B5CF6);
              }
              return Colors.grey.shade200;
            }),
            hintText: "Search",
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color(0xFF8B5CF6),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(StickyHeaderInput oldDelegate) {
    return oldDelegate.size != size;
  }
}
