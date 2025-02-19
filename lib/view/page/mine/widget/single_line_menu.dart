import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jd_mall_flutter/store/app_state.dart';
import 'package:jd_mall_flutter/models/mine_menu_tab_info.dart';
import 'package:jd_mall_flutter/component/page_menu.dart';

Widget singleLineMenu(BuildContext context) {
  return StoreBuilder<AppState>(
    builder: (context, store) {
      List<FunctionInfo> menuData = store.state.minePageState.menuTabInfo.functionList ?? [];

      return PageMenu(menuDataList: menuData);
    },
  );
}
