import 'package:flutter_kpi/data/homedata_entity.dart';
import 'package:flutter_kpi/data/team_list_entity.dart';
import 'package:flutter_kpi/data/user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
//    if (1 == 0) {
//      return null;
//    }
//    else if (T.toString() == "AccountEntity") {
//      return AccountEntity.fromJson(json) as T;
//    }
    if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeEntity") {
      return HomeEntity.fromJson(json) as T;
    } else if (T.toString() == "TeamListData") {
      return TeamListData.fromJson(json) as T;
    }else {
      return null;
    }
  }
}
