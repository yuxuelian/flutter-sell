import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../bean/goods_bean.dart';
import '../bean/ratings_bean.dart';
import '../bean/seller_bean.dart';

class DataUtils {
  DataUtils._(BuildContext context) {
    print('初始化');
  }

  static List<GoodsBean> _goodsBeanList;
  static List<RatingsBean> _ratingsBeanList;
  static SellerBean _sellerBean;

  static Future<List<GoodsBean>> getGoodsBeanList(BuildContext context) async {
    if (_goodsBeanList == null) {
      final goodsDataStr = await DefaultAssetBundle.of(context).loadString('json/goods_data.json');
      final resList = json.decode(goodsDataStr);
      _goodsBeanList = [];
      for (var dataItem in resList == null ? [] : resList) {
        _goodsBeanList.add(GoodsBean.fromJson(dataItem));
      }
    }
    return Future.value(_goodsBeanList);
  }

  static Future<List<RatingsBean>> getRatingsBeanList(BuildContext context) async {
    if (_ratingsBeanList == null) {
      final ratingsDataStr = await DefaultAssetBundle.of(context).loadString('json/ratings_data.json');
      final resList = json.decode(ratingsDataStr);
      _ratingsBeanList = [];
      for (var dataItem in resList == null ? [] : resList) {
        _ratingsBeanList.add(RatingsBean.fromJson(dataItem));
      }
    }
    return Future.value(_ratingsBeanList);
  }

  static Future<SellerBean> getSellerBean(BuildContext context) async {
    if (_sellerBean == null) {
      final sellerData = await DefaultAssetBundle.of(context).loadString('json/seller_data.json');
      _sellerBean = SellerBean.fromJson(json.decode(sellerData));
    }
    return Future.value(_sellerBean);
  }
}
