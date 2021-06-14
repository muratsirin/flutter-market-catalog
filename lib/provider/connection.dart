import 'package:connectivity/connectivity.dart';

enum NetworkStatus { online, offline }

class Connection {
  ConnectivityResult connectivityResult;
  bool isConnected;

  Future<void> getNetworkStatus() async {
    connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
    } else {
      isConnected = false;
    }
  }
}
