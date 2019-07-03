import 'dart:convert' show json;

class GoodsBean {
  int type;
  String name;
  List<Food> foods;

  GoodsBean.fromParams({this.type, this.name, this.foods});

  factory GoodsBean(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new GoodsBean.fromJson(json.decode(jsonStr))
          : new GoodsBean.fromJson(jsonStr);

  GoodsBean.fromJson(jsonRes) {
    type = jsonRes['type'];
    name = jsonRes['name'];
    foods = jsonRes['foods'] == null ? null : [];

    for (var foodsItem in foods == null ? [] : jsonRes['foods']) {
      foods.add(foodsItem == null ? null : new Food.fromJson(foodsItem));
    }
  }

  @override
  String toString() {
    return '{"type": $type,"name": ${name != null ? '${json.encode(name)}' : 'null'},"foods": $foods}';
  }
}

class Food {
  int oldPrice;
  int price;
  int rating;
  int sellCount;
  String description;
  String icon;
  String image;
  String info;
  String name;
  List<GoodsRating> ratings;

  // 食物数量
  int count = 0;

  Food.fromParams(
      {this.oldPrice,
      this.price,
      this.rating,
      this.sellCount,
      this.description,
      this.icon,
      this.image,
      this.info,
      this.name,
      this.ratings});

  Food.fromJson(jsonRes) {
    oldPrice = jsonRes['oldPrice'];
    price = jsonRes['price'];
    rating = jsonRes['rating'];
    sellCount = jsonRes['sellCount'];
    description = jsonRes['description'];
    icon = jsonRes['icon'];
    image = jsonRes['image'];
    info = jsonRes['info'];
    name = jsonRes['name'];
    ratings = jsonRes['ratings'] == null ? null : [];

    for (var ratingsItem in ratings == null ? [] : jsonRes['ratings']) {
      ratings.add(
          ratingsItem == null ? null : new GoodsRating.fromJson(ratingsItem));
    }
  }

  @override
  String toString() {
    return '{"oldPrice": $oldPrice,"price": $price,"rating": $rating,"sellCount": $sellCount,"description": ${description != null ? '${json.encode(description)}' : 'null'},"icon": ${icon != null ? '${json.encode(icon)}' : 'null'},"image": ${image != null ? '${json.encode(image)}' : 'null'},"info": ${info != null ? '${json.encode(info)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"ratings": $ratings}';
  }
}

class GoodsRating {
  int rateTime;
  int rateType;
  String avatar;
  String text;
  String username;

  GoodsRating.fromParams(
      {this.rateTime, this.rateType, this.avatar, this.text, this.username});

  GoodsRating.fromJson(jsonRes) {
    rateTime = jsonRes['rateTime'];
    rateType = jsonRes['rateType'];
    avatar = jsonRes['avatar'];
    text = jsonRes['text'];
    username = jsonRes['username'];
  }

  @override
  String toString() {
    return '{"rateTime": $rateTime,"rateType": $rateType,"avatar": ${avatar != null ? '${json.encode(avatar)}' : 'null'},"text": ${text != null ? '${json.encode(text)}' : 'null'},"username": ${username != null ? '${json.encode(username)}' : 'null'}}';
  }
}
