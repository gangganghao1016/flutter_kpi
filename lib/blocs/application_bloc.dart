import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

class ApplicationBloc extends BaseBloc {
  BehaviorSubject<int> _appEvent = BehaviorSubject<int>();

  get _appEventSink => _appEvent.sink;

  get appEventStream => _appEvent.stream;

  @override
  void dispose() {
    super.dispose();
    _appEvent.close();
  }

  void sendAppEvent(int type) {
    _appEventSink.add(type);
  }
}
