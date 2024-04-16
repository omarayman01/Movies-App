import 'package:flutter/material.dart';

class PosterItem extends StatelessWidget {
  const PosterItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 2 / 4,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/pics/Image2.png'))),
            ),
            const Center(
                child:
                    Image(image: AssetImage('assets/pics/play-button-2.png')))
          ],
        ),
      ),
    );
  }
}
