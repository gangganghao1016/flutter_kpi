class PageStatusEvent {
  String errorDesc;
  bool isRefresh;
  PageEnum pageStatus;
  PageStatusEvent({this.errorDesc,this.isRefresh, this.pageStatus});
}

enum PageEnum {
  showLoading,
  showError,
  showEmpty,
  showContent,
}
