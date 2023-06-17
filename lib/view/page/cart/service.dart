import 'package:jd_mall_flutter/common/http/http.dart';
import 'package:jd_mall_flutter/models/cart_goods.dart';
import 'package:jd_mall_flutter/models/goods_page_info.dart';
import 'package:jd_mall_flutter/config/global_configs.dart';

class CartApi {
  static Future queryCartGoods() async {
    var res = await httpManager.post('${GlobalConfigs().get("host")}/cart/queryCartGoodsList', null, null, null);
    if (res?.code != '0') {
      return null;
    }
    return (res?.data as List<dynamic>?)?.map((e) => CartGoods.fromJson(e as Map<String, dynamic>)).toList() ?? [];
  }

  static Future queryGoodsListByPage(int currentPage, int pageSize) async {
    var res = await httpManager.post(
        '${GlobalConfigs().get("host")}/cart/queryMaybeLikeList', {"currentPage": currentPage, "pageSize": pageSize}, null, null);
    if (res?.code != '0') {
      return null;
    }
    return GoodsPageInfo.fromJson(res?.data ?? {});
  }
}
