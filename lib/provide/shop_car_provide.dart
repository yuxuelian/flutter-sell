import 'package:flutter/cupertino.dart';

import '../bean/goods_bean.dart';

class ShopCarProvide with ChangeNotifier {
  List<Food> _shopCarFoodList = [];

  void plusFoodCount(Food food) {
    food.count++;
    final index = _shopCarFoodList.indexOf(food);
    if (index == -1) {
      // 第一次 加
      _shopCarFoodList.add(food);
    }
    notifyListeners();
  }

  void minusFoodCount(Food food) {
    food.count--;
    if (food.count <= 0) {
      food.count = 0;
      _shopCarFoodList.remove(food);
    }
    notifyListeners();
  }

  void clear() {
    _shopCarFoodList.forEach((food) {
      food.count = 0;
    });
    _shopCarFoodList.clear();
    notifyListeners();
  }

  List<Food> get shopCarFoodList => _shopCarFoodList;

  int get allCount {
    int count = 0;
    // 计算count
    for (var food in _shopCarFoodList) {
      count += food.count;
    }
    return count;
  }

  int get totalPrice {
    int totalPrice = 0;
    // 计算 totalPrice
    for (var food in _shopCarFoodList) {
      totalPrice += food.count * food.price;
    }
    return totalPrice;
  }
}
