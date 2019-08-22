//import 'dart:collection';
//
//import 'bloc_provider.dart';
//import 'package:rxdart/rxdart.dart';
//import 'package:flutter_kpi/data/team_list_entity.dart';
//class MainBloc extends BaseBloc {
//  int _reposPage = 1;
//  BehaviorSubject<TeamListData> _repos =
//      BehaviorSubject<TeamListData>();
//
//  get _reposSink => _repos.sink;
//
//  get reposStream => _repos.stream;
//
//  List<TeamListDataList> _reposList = new List();
//
//  Future getArticleListProject(String labelId, int page) {
//    bool isRefresh;
//    if (page == 1) {
//      isRefresh = true;
//    } else {
//      isRefresh = false;
//    }
//    return repository.getArticleListProject(page).then((list) {
//      if(page ==1){
//        _reposList.clear();
//      }
//      _reposList.addAll(list);
//      _reposSink.add(UnmodifiableListView<ReposModel>(_reposList));
//      postPageEmpty2PageContent(isRefresh, list);
//    }).catchError((error) {
//      postPageError(isRefresh, error.toString());
//    });
//  }
//
//
//  @override
//  void dispose() {
//    super.dispose();
//    _repos.close();
//  }
//
//  Future getData({String labelId, int page}) {
//    return getArticleListProject(labelId, page);
//  }
//
//  Future onLoadMore({String labelId}) {
//    _reposPage += 1;
//    return getData(labelId: labelId, page: _reposPage);
//  }
//
//  Future onRefresh({String labelId}) {
//    _reposPage = 1;
////    LogUtil.e("onRefresh labelId: $labelId" + "   _reposPage: $_reposPage");
//    return getData(labelId: labelId, page: 1);
//  }
//}
