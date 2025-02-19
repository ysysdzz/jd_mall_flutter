import 'package:flutter/material.dart';
import 'package:jd_mall_flutter/common/util/color_util.dart';
import 'package:jd_mall_flutter/common/util/screen_util.dart';
import 'package:jd_mall_flutter/component/image/asset_image.dart';
import 'package:jd_mall_flutter/generated/l10n.dart';

Widget header(BuildContext context) {
  return Container(
    color: ColorUtil.hex2Color('#FE0F22'),
    height: 50 + getStatusHeight(context),
    padding: EdgeInsets.only(top: getStatusHeight(context)),
    child: Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
            top: 0,
            left: 16,
            child: Column(
              children: [
                assetImage('images/scan.png', 24, 24),
                Text(
                  S.of(context).scan,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            )),
        Positioned(
            top: 2,
            right: 16,
            child: Column(
              children: [
                assetImage('images/message.png', 24, 24),
                Text(
                  S.of(context).message,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            )),
        Positioned(
            top: 1,
            child: Container(
              height: 38,
              width: getScreenWidth(context) - 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorUtil.hex2Color("#F0F1ED"),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 34,
                    child: UnconstrainedBox(
                      child: assetImage('images/ic_search.png', 20, 20),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 36.0,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).searchInputTip,
                        style: TextStyle(
                          color: ColorUtil.hex2Color('#818286'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}
