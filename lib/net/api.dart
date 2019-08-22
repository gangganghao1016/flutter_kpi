
class Api{
  static const int resultCodeSuccess=200;
  static const int resultCodeTokenInvalid=-105;//token失效
  static const String baseUrl = 'http://performance.wxy-zc-forever.com/';
  static const String baseUrl_test = 'http://performance.danyangjin.com/api/';
  //取个人绩效各项分数
  static const String homeData = 'api/performance/homeData';
  //登录
  static const String login = 'api/user/login';

  //绩效列表
  /**
   * http://performance.wxy-zc-forever.com/api/team/getGroupList
   * ?page=1&pageSize=10&parentTeamId=e587b2eef4ceb258955e15548b6e3548
   *
   */
  static const String groupList='api/team/getGroupList';
  /**
   * http://performance.wxy-zc-forever.com
   * /api/performance/getTotalPerformanceList
   * ?year=2019&quarter=3
   * &groupId=&teamId=e587b2eef4ceb258955e15548b6e3548
   * &searchName=&page=1&pageSize=10
   * groupId 5个小组（商户小组，清算小组，app小组，企业应用小组，插件小组）
   */
  static const String performanceTotal = 'api/performance/getTotalPerformanceList';

//teamId groupId user对象取值
  //维度列表
  /**
   * get方法
   * http://performance.wxy-zc-forever.com/api/team/getTeamList?page=1&pageSize=10
   * http://performance.wxy-zc-forever.com/api/team/getTeamGroupParentDimensionList
   * ?searchName=&teamId=e587b2eef4ceb258955e15548b6e3548&groupId=defb78090c284b7a0a0c5c540249a2b0
   * &page=1&pageSize=10
   *
   * http://performance.wxy-zc-forever.com/api/team/getGroupList
   * ?page=1&pageSize=500&parentTeamId=e587b2eef4ceb258955e15548b6e3548
   */
  /**
   * http://performance.wxy-zc-forever.com/api/performance/getGroupParentDimensionList
   * ?groupId=defb78090c284b7a0a0c5c540249a2b0
   */
  // page=1, pagesize=10 分页
  static const String team = 'api/team/getTeamList';

  // groupId 获取纬度列表接口
  static const String teamGroupParentDimensionList = 'api/team/getTeamGroupParentDimensionList';

  //查看 维度列表-考核项列表
  /**
   * http://performance.wxy-zc-forever.com/api/performance/getDimensionList
   * ?searchName=&teamId=e587b2eef4ceb258955e15548b6e3548&groupId=defb78090c284b7a0a0c5c540249a2b0
   * &parentDimensionId=2c457d09943ddf3c95822efc4e0995e1
   * &page=1&pageSize=10
   */
  static const String dimensionList='api/performance/getDimensionList';
  //退出登录
  static const String loginOut = 'api/user/loginOut';

}