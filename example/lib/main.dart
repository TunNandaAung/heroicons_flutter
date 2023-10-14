import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:heroicons_flutter/heroicons_list.dart';
import 'package:heroicons_flutter_example/widgets/custom_tab_bar.dart';
import 'package:heroicons_flutter_example/widgets/sticky_header_input.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const HeroiconsFlutter());
}

class HeroiconsFlutter extends StatelessWidget {
  const HeroiconsFlutter({super.key});

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
        return HeroiconsOutline.academicCap;
      case 1:
        return HeroiconsSolid.academicCap;
      case 2:
        return HeroiconsMini.academicCap;
    }
    return HeroiconsOutline.academicCap;
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
              child: Stack(
                children: [
                  _coverImage(size),
                  Positioned(
                    bottom: size.height / 60,
                    left: 16.0,
                    child: _urlContainer(
                      url: 'https://github.com/TunNandaAung/heroicons_flutter',
                      label: 'Documentation',
                    ),
                  ),
                  Positioned(
                    bottom: size.height / 60,
                    right: 16.0,
                    child: _urlContainer(
                      url: 'https://heroicons.com',
                      label: 'heroicons.com',
                    ),
                  ),
                ],
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
                maxCrossAxisExtent: 350.0,
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

  Widget _coverImage(Size size) {
    return Container(
      height: size.width > 800 ? size.height / 2.5 : size.height / 3,
      width: double.infinity,
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
    );
  }

  Widget _urlContainer({required String url, required String label}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF8B5CF6).withOpacity(.09),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () async {
          await launchUrl(
            Uri.parse(url),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(HeroiconsOutline.bookOpen),
              const SizedBox(width: 8.0),
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
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
                padding:
                    const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
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
