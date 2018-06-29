import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

typedef Widget SwiperPaginationBuilder(
    BuildContext context, SwiperPluginConfig config);

class SwiperCustomPagination extends SwiperPlugin {
  final SwiperPaginationBuilder builder;
  SwiperCustomPagination({@required this.builder}) : assert(builder != null);
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return builder(context, config);
  }
}

class SwiperDotPagination extends SwiperPlugin {
  /// Alignment.bottomCenter by default when scrollDirection== Axis.horizontal
  /// Alignment.centerRight by default when scrollDirection== Axis.vertical
  final AlignmentGeometry alignment;

  /// Distance between pagination and the container
  final EdgeInsetsGeometry margin;

  /// Build the widet
  final SwiperPlugin builder;
  final Key key;
  final Color activeColor;

  /// dot style pagination
  static const SwiperPlugin dots =
      const DotSwiperPaginationBuilder(activeColor: Colors.green);

  /// fraction style pagination
  static const SwiperPlugin fraction = const FractionPaginationBuilder();
  const SwiperDotPagination(
      {this.alignment,
      this.key,
      this.activeColor,
      this.margin: const EdgeInsets.all(10.0),
      this.builder: SwiperDotPagination.dots});
  Widget build(BuildContext context, SwiperPluginConfig config) {
    AlignmentGeometry alignment = this.alignment ??
        (config.scrollDirection == Axis.horizontal
            ? Alignment.bottomCenter
            : Alignment.centerRight);
    return new Align(
      key: key,
      alignment: alignment,
      child: new Container(
        margin: margin,
        child: this.builder.build(context, config),
      ),
    );
  }
}
