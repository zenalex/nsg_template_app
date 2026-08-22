import 'package:nsg_data/nsg_data.dart';

/// Список серверов, между которыми может переключаться приложение.
/// NsgDataProvider требует его обязательным параметром availableServers.
class NsgServerOptions {
  static String get serverUriDataController => availableServers.currentServer;

  static NsgServerParams availableServers = NsgServerParams({
    'https://localhost': 'main',
    'https://localhost:5001': 'test',
  }, 'https://localhost');
}
