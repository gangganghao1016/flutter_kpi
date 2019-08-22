class TeamListData {
	/**
			{
			"resultCode": 200,
			"resultMessage": "请求成功",
			"data": {
			"total": 4,
			"list": [{
			"parentDimensionId": "2c457d09943ddf3c95822efc4e0995e1",
			"parentDimensionName": "团队维度",
			"groupName": "APP小组",
			"groupId": "defb78090c284b7a0a0c5c540249a2b0",
			"baseScore": 0.0
			}, {
			"parentDimensionId": "9af484613a9df4c8723a1ee82a1aaf3f",
			"parentDimensionName": "事故维度",
			"groupName": "APP小组",
			"groupId": "defb78090c284b7a0a0c5c540249a2b0",
			"baseScore": 0.0
			}, {
			"parentDimensionId": "b954bcbeb74b8bbe71fcd02e7d5cfc93",
			"parentDimensionName": "个人目标维度",
			"groupName": "APP小组",
			"groupId": "defb78090c284b7a0a0c5c540249a2b0",
			"baseScore": 0.0
			}, {
			"parentDimensionId": "f45dbdca27093d92ce1bc8496120bfa2",
			"parentDimensionName": "项目维度",
			"groupName": "APP小组",
			"groupId": "defb78090c284b7a0a0c5c540249a2b0",
			"baseScore": 0.0
			}]
			}
			}
	 */
//维度列表数据
	int total;
	List<TeamListDataList> xList;

	TeamListData({this.total, this.xList});

	TeamListData.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		if (json['list'] != null) {
			xList = new List<TeamListDataList>();(json['list'] as List).forEach((v) { xList.add(new TeamListDataList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class TeamListDataList {
	String parentDimensionId;
	String groupName;
	String groupId;
	double baseScore;
	String parentDimensionName;

	TeamListDataList({this.parentDimensionId, this.groupName, this.groupId, this.baseScore, this.parentDimensionName});

	TeamListDataList.fromJson(Map<String, dynamic> json) {
		parentDimensionId = json['parentDimensionId'];
		groupName = json['groupName'];
		groupId = json['groupId'];
		baseScore = json['baseScore'];
		parentDimensionName = json['parentDimensionName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['parentDimensionId'] = this.parentDimensionId;
		data['groupName'] = this.groupName;
		data['groupId'] = this.groupId;
		data['baseScore'] = this.baseScore;
		data['parentDimensionName'] = this.parentDimensionName;
		return data;
	}
}
