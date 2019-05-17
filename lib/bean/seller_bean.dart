import 'dart:convert' show json;

class SellerBean {

  int deliveryPrice;
  int deliveryTime;
  int minPrice;
  int ratingCount;
  int sellCount;
  double foodScore;
  double rankRate;
  double score;
  double serviceScore;
  String avatar;
  String bulletin;
  String description;
  String name;
  List<String> infos;
  List<String> pics;
  List<Supports> supports;

  SellerBean.fromParams({this.deliveryPrice, this.deliveryTime, this.minPrice, this.ratingCount, this.sellCount, this.foodScore, this.rankRate, this.score, this.serviceScore, this.avatar, this.bulletin, this.description, this.name, this.infos, this.pics, this.supports});

  factory SellerBean(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SellerBean.fromJson(json.decode(jsonStr)) : new SellerBean.fromJson(jsonStr);

  SellerBean.fromJson(jsonRes) {
    deliveryPrice = jsonRes['deliveryPrice'];
    deliveryTime = jsonRes['deliveryTime'];
    minPrice = jsonRes['minPrice'];
    ratingCount = jsonRes['ratingCount'];
    sellCount = jsonRes['sellCount'];
    foodScore = jsonRes['foodScore'];
    rankRate = jsonRes['rankRate'];
    score = jsonRes['score'];
    serviceScore = jsonRes['serviceScore'];
    avatar = jsonRes['avatar'];
    bulletin = jsonRes['bulletin'];
    description = jsonRes['description'];
    name = jsonRes['name'];
    infos = jsonRes['infos'] == null ? null : [];

    for (var infosItem in infos == null ? [] : jsonRes['infos']){
      infos.add(infosItem);
    }

    pics = jsonRes['pics'] == null ? null : [];

    for (var picsItem in pics == null ? [] : jsonRes['pics']){
      pics.add(picsItem);
    }

    supports = jsonRes['supports'] == null ? null : [];

    for (var supportsItem in supports == null ? [] : jsonRes['supports']){
      supports.add(supportsItem == null ? null : new Supports.fromJson(supportsItem));
    }
  }

  @override
  String toString() {
    return '{"deliveryPrice": $deliveryPrice,"deliveryTime": $deliveryTime,"minPrice": $minPrice,"ratingCount": $ratingCount,"sellCount": $sellCount,"foodScore": $foodScore,"rankRate": $rankRate,"score": $score,"serviceScore": $serviceScore,"avatar": ${avatar != null?'${json.encode(avatar)}':'null'},"bulletin": ${bulletin != null?'${json.encode(bulletin)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"infos": $infos,"pics": $pics,"supports": $supports}';
  }
}

class Supports {

  int type;
  String description;

  Supports.fromParams({this.type, this.description});

  Supports.fromJson(jsonRes) {
    type = jsonRes['type'];
    description = jsonRes['description'];
  }

  @override
  String toString() {
    return '{"type": $type,"description": ${description != null?'${json.encode(description)}':'null'}}';
  }
}
