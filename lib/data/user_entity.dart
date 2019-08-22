/**
 * {
    "resultCode": 200,
    "resultMessage": "请求成功",
    "data": {
    "accessToken": "51aa291c22ea409f9600bfa7ed8bb8e1",
    "userId": "eab0988057df57bb6b30c8a581f5aa9a",
    "headImg": "https://performance-system-release.oss-cn-hangzhou.aliyuncs.com/headImage/head_image.jpeg",
    "username": "wangdigang",
    "realName": "王迪钢",
    "flowerName": "Grady",
    "gender": 1,
    "phone": "18868416396",
    "teamId": "e587b2eef4ceb258955e15548b6e3548",
    "teamName": "前端团队",
    "groupId": "defb78090c284b7a0a0c5c540249a2b0",
    "groupName": "APP小组",
    "roleId": "10004",
    "roleName": "组员",
    "isJoin": 0
    }
    }
 */
class UserEntity {
  String accessToken;
  String userId;
  String headImg;
  String username;
  String realName;
  String flowerName;
  int gender;
  String phone;
  String teamId;
  String teamName;
  String groupId;
  String groupName;
  String roleId;
  String roleName;
  int isJoin;

  UserEntity(
      {this.teamName,
      this.headImg,
      this.gender,
      this.roleId,
      this.groupId,
      this.flowerName,
      this.accessToken,
      this.userId,
      this.isJoin,
      this.realName,
      this.groupName,
      this.phone,
      this.teamId,
      this.roleName,
      this.username});

  UserEntity.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    headImg = json['headImg'];
    gender = json['gender'];
    roleId = json['roleId'];
    groupId = json['groupId'];
    flowerName = json['flowerName'];
    accessToken = json['accessToken'];
    userId = json['userId'];
    isJoin = json['isJoin'];
    realName = json['realName'];
    groupName = json['groupName'];
    phone = json['phone'];
    teamId = json['teamId'];
    roleName = json['roleName'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamName'] = this.teamName;
    data['headImg'] = this.headImg;
    data['gender'] = this.gender;
    data['roleId'] = this.roleId;
    data['groupId'] = this.groupId;
    data['flowerName'] = this.flowerName;
    data['accessToken'] = this.accessToken;
    data['userId'] = this.userId;
    data['isJoin'] = this.isJoin;
    data['realName'] = this.realName;
    data['groupName'] = this.groupName;
    data['phone'] = this.phone;
    data['teamId'] = this.teamId;
    data['roleName'] = this.roleName;
    data['username'] = this.username;
    return data;
  }

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"accessToken\":\"" +
        accessToken +
        "\"" +
        '}';
  }
}
