import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatelessWidget {
  final List<Map<IconData, String>> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          indicatorPadding: EdgeInsets.zero,
          labelColor: const Color(0xFF8B5CF6),
          labelStyle: GoogleFonts.inter(),
          unselectedLabelColor: Colors.black,
          indicator: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFF8B5CF6),
                width: 3.0,
              ),
            ),
          ),
          tabs: icons
              .asMap()
              .map(
                (i, e) => MapEntry(
                  i,
                  Tab(
                    text: e.values.first,
                    icon: Icon(
                      e.keys.first,
                      color: i == selectedIndex
                          ? const Color(0xFF8B5CF6)
                          : Colors.black,
                      size: 20.0,
                    ),
                  ),
                ),
              )
              .values
              .toList(),
          onTap: onTap,
        ),
      ),
    );
  }
}
