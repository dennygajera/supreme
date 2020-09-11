import 'package:flutter/material.dart';
import 'package:login/helpers/slider/slidericon.dart';

import '../ease_in_widget.dart';

class TopSliderForMobile extends StatelessWidget {
  const TopSliderForMobile({
    Key key,
    @required ScrollController scrollController5,
    @required this.slider,
  })  : _scrollController5 = scrollController5,
        super(key: key);

  final ScrollController _scrollController5;
  final List<SliderIcon> slider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 480,
        child: ListView.builder(
          controller: _scrollController5,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: EaseInWidget(
                radius: 30,
                image: slider[i % slider.length].image,
                secondImage: slider[i % slider.length].image,
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamed(
                  //         '/room-details');
                  print("Hello");
                }),
          ),
          itemCount: slider.length * 100,
        ),
      ),
    );
  }
}
