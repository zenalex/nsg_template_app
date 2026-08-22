import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';

import '../options/server_options.dart';

class DataControllerGenerated extends NsgBaseController {
  NsgDataProvider? provider;
  @override
  Future onInit() async {
    provider ??= NsgDataProvider(
        applicationName: 'application_name',
        firebaseToken: '',
        applicationVersion: '',
        availableServers: NsgServerOptions.availableServers);
    provider!.serverUri = NsgServerOptions.serverUriDataController;

    provider!.useNsgAuthorization = false;
    provider!.loginRequired = false;
    await provider!.connect(this);
    if (provider!.isAnonymous && provider!.loginRequired) {
      // Страницу логина показывает приложение через eventOpenLoginPage —
      // провайдер данных виджетов больше не знает.
      await provider!.openLoginPage();
      await loadData();
    } else {
      await loadData();
    }

    super.onInit();
  }

  Future loadData() async {
    currentStatus = GetStatus.success(NsgBaseController.emptyData);
    sendNotify();
  }
}
