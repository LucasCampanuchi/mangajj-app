import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';
part 'job.controller.g.dart';

class JobController = _JobControllerBase with _$JobController;

abstract class _JobControllerBase with Store {
  @observable
  bool isConnected = false;

  @action
  Future<void> updateStatusConnection() async {
    ConnectivityResult connection = await (Connectivity().checkConnectivity());

    if (connection == ConnectivityResult.none) {
      isConnected = false;
    } else {
      isConnected = true;
    }
  }
}
