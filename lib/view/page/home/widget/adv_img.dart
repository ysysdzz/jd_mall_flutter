import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jd_mall_flutter/store/app_state.dart';
import 'package:jd_mall_flutter/component/image/asset_image.dart';
import 'package:jd_mall_flutter/view/page/home/redux/home_page_state.dart';
import 'package:jd_mall_flutter/common/util/screen_util.dart';

import 'package:jd_mall_flutter/view/vebview/webview_page.dart';
import 'package:jd_mall_flutter/view/vebview/type.dart';

Widget advBanner(BuildContext context) {
  return StoreConnector<AppState, HomePageState>(
    converter: (store) {
      return store.state.homePageState;
    },
    builder: (context, state) {
      return GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(WebViewPage.name, arguments: WebViewPageArguments("https://pro.m.jd.com/mall/active/2WrXYwmYpiy7EpWjDETSVyhXfLCb/index.html")),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(0),
            child: CachedNetworkImage(
              height: 90,
              imageUrl: state.homePageInfo.adUrl ?? "",
              placeholder: (context, url) => assetImage("images/default.png", getScreenWidth(context) - 24, 90),
              errorWidget: (context, url, error) => assetImage("images/default.png", getScreenWidth(context) - 24, 90),
              fit: BoxFit.fill,
            ),
          ));
    },
  );
}
