import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jd_mall_flutter/common/style/common_style.dart';
import 'package:jd_mall_flutter/component/carousel/carousel_widget.dart';
import 'package:jd_mall_flutter/component/carousel/helpers/flutter_carousel_options.dart';
import 'package:jd_mall_flutter/component/image/asset_image.dart';
import 'package:jd_mall_flutter/component/carousel/indicators/circular_wave_slide_indicator.dart';
import 'package:jd_mall_flutter/store/app_state.dart';
import 'package:jd_mall_flutter/view/page/detail/redux/detail_page_state.dart';
import 'package:jd_mall_flutter/common/util/screen_util.dart';

Widget imgSlider(BuildContext context) {
  double statusHeight = getStatusHeight(context);
  double imgHeight = getScreenHeight(context) / 2 - statusHeight - getBottomSpace(context);
  double screenWidth = getScreenWidth(context);

  return StoreConnector<AppState, DetailPageState>(
    converter: (store) {
      return store.state.detailPageState;
    },
    builder: (context, state) {
      List<String> imgList = state.selectInfo.imgList ?? [];

      final List<Widget> sliders = imgList
          .map((url) => CachedNetworkImage(
                height: imgHeight,
                width: screenWidth,
                imageUrl: url,
                placeholder: (context, url) => assetImage("images/default.png", screenWidth, imgHeight),
                errorWidget: (context, url, error) => assetImage("images/default.png", screenWidth, imgHeight),
                fit: BoxFit.fill,
              ))
          .toList();

      return Container(
        height: imgHeight,
        width: getScreenWidth(context),
        margin: EdgeInsets.only(top: statusHeight),
        child: Carousel(
          options: CarouselOptions(
            height: imgHeight,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 12),
            slideIndicator: CircularWaveSlideIndicator(
              itemSpacing: 14,
              indicatorRadius: 4,
              indicatorBorderWidth: 0,
              currentIndicatorColor: CommonStyle.themeColor,
              indicatorBackgroundColor: Colors.grey,
            ),
          ),
          items: sliders,
        ),
      );
    },
  );
}
