/**
 * {
    "resultCode": 200,
    "resultMessage": "请求成功",
    "data": {
    "totalScore": 0.0,
    "subtractionScore": 0.0,
    "additionScore": 0.0,
    "baseScore": 0.0
    }
    }
 */
class HomeEntity {
  double additionScore;
  double subtractionScore;
  double baseScore;
  double totalScore;

  HomeEntity({this.additionScore, this.subtractionScore, this.baseScore, this.totalScore});

  HomeEntity.fromJson(Map<String, dynamic> json) {
    additionScore = json['additionScore'];
    subtractionScore = json['subtractionScore'];
    baseScore = json['baseScore'];
    totalScore = json['totalScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionScore'] = this.additionScore;
    data['subtractionScore'] = this.subtractionScore;
    data['baseScore'] = this.baseScore;
    data['totalScore'] = this.totalScore;
    return data;
  }
}