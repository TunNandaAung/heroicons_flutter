import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:heroicons_flutter/heroicons_list.dart';

void main() {
  runApp(const HeroiconsFlutter());
}

class HeroiconsFlutter extends StatelessWidget {
  const HeroiconsFlutter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroicons Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.interTextTheme(),
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          prefixIconColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.focused)) {
              return const Color(0xFF8B5CF6);
            }
            return Colors.grey.shade500;
          }),
        ),
      ),
      home: const Home(title: 'Heroicons Flutter'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String query = '';
  int selectedIndex = 0;

  IconData getIcon(String name) {
    switch (selectedIndex) {
      case 0:
        return HeroiconsOutline.fromString(name);
      case 1:
        return HeroiconsSolid.fromString(name);
      case 2:
        return HeroiconsMini.fromString(name);
    }
    return HeroiconsOutline.fromString(name);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final filteredIcons = heroiconsList
        .where(
            (icon) => query.isEmpty || icon.name.toLowerCase().contains(query))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: size.width > 800 ? size.height / 2.5 : size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/heroicons-cover.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10.0),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyHeaderInput(
                  size: 50.0,
                  onInputChanged: (val) {
                    setState(() {
                      query = val;
                    });
                  }),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10.0),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _iconContainer(
                    getIcon(filteredIcons[index].name),
                    filteredIcons[index].name,
                  );
                },
                childCount: filteredIcons.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          size.width > 640 ? const SizedBox() : _bottomBarContainer(),
      floatingActionButton:
          size.width > 640 ? _bottomBarContainer() : const SizedBox(),
    );
  }

  Widget _iconContainer(IconData icon, String name) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: Colors.grey.shade100,
          ),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(name),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomBarContainer() {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFf3eeff),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: width > 900 ? width / 2 : width / 1.2,
      child: CustomTabBar(
        icons: [
          {HeroiconsOutline.sparkles: 'Outline'},
          {HeroiconsSolid.rocketLaunch: 'Solid'},
          {HeroiconsMini.fire: 'Mini'},
        ],
        selectedIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
      ),
    );
  }
}

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
            prefixIcon: const Icon(HeroiconsOutline.magnifyingGlass),
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
