import 'dart:convert' show json;

class RatingsBean {
  int deliveryTime;
  int rateTime;
  int rateType;
  int score;
  String avatar;
  String text;
  String username;
  List<String> recommend;

  RatingsBean.fromParams(
      {this.deliveryTime,
      this.rateTime,
      this.rateType,
      this.score,
      this.avatar,
      this.text,
      this.username,
      this.recommend});

  factory RatingsBean(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new RatingsBean.fromJson(json.decode(jsonStr))
          : new RatingsBean.fromJson(jsonStr);

  RatingsBean.fromJson(jsonRes) {
    deliveryTime = jsonRes['deliveryTime'];
    rateTime = jsonRes['rateTime'];
    rateType = jsonRes['rateType'];
    score = jsonRes['score'];
    avatar = jsonRes['avatar'];
    text = jsonRes['text'];
    username = jsonRes['username'];
    recommend = jsonRes['recommend'] == null ? null : [];

    for (var recommendItem in recommend == null ? [] : jsonRes['recommend']) {
      recommend.add(recommendItem);
    }
  }

  @override
  String toString() {
    return '{"deliveryTime": $deliveryTime,"rateTime": $rateTime,"rateType": $rateType,"score": $score,"avatar": ${avatar != null ? '${json.encode(avatar)}' : 'null'},"text": ${text != null ? '${json.encode(text)}' : 'null'},"username": ${username != null ? '${json.encode(username)}' : 'null'},"recommend": $recommend}';
  }
}
