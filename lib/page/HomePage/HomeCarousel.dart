import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../components/SwiperDot.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key key, this.imgs}) : super(key: key);
  final List imgs;
  @override
  HomeCarouselState createState() => new HomeCarouselState();
}

class HomeCarouselState extends State<HomeCarousel> {
  @override
  Widget build(BuildContext context) {
    List imgs = widget.imgs;
    return new Container(
        height: 200.0,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              imgs[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: imgs.length,
          autoplay: true,
          pagination: new SwiperDotPagination(),
        ));
  }
}
