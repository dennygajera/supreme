import 'package:flutter/material.dart';
import 'package:login/helpers/slider/slidericon.dart';

import '../ease_in_widget.dart';

class TopSliderForTab extends StatelessWidget {
  const TopSliderForTab({
    Key key,
    @required this.size,
    @required this.divSize,
    @required this.slider,
  }) : super(key: key);

  final Size size;
  final double divSize;
  final List<SliderIcon> slider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height > divSize ? 80 : 40,
        width: size.height > divSize ? 550 : 100,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: EaseInWidget(
                  radius: 30,
                  image: slider[i % slider.length].image,
                  secondImage: slider[i % slider.length].image,
                  onTap: () {
                    Navigator.of(context).pushNamed('/room-details');
                    print("Hello");
                  })),
          itemCount: slider.length * 100,
        ),
      ),
    );
  }
}
