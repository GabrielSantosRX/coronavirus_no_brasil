import 'package:data_connection_checker/data_connection_checker.dart';

abstract class IConnectivity {
  Future<bool> get isConnected;
}

class Connectivity implements IConnectivity {
  Connectivity(this.connectionChecker);

  final DataConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
