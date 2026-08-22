import 'package:nsg_data/nsg_data.dart';

/// Список серверов, между которыми может переключаться приложение.
/// NsgDataProvider требует его обязательным параметром availableServers.
class NsgServerOptions {
  static String get serverUriDataController => availableServers.currentServer;

  static NsgServerParams availableServers = NsgServerParams({
    'http://server.path': 'main',
  }, 'http://server.path');
}
