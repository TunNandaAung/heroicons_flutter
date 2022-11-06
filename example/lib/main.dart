class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return new child: Column(
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