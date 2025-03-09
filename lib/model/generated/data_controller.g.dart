import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';

class DataControllerGenerated extends NsgBaseController {
  NsgDataProvider? provider;
  @override
  Future onInit() async {
    provider ??= NsgDataProvider(
        applicationName: 'application_name',
        firebaseToken: '',
        applicationVersion: '',
        availableServers: NsgServerParams(
            {'https://localhost': 'main', 'https://localhost:5001': 'test'},
            'https://localhost'));
    provider!.serverUri = 'http://server.path';

    provider!.useNsgAuthorization = false;
    provider!.loginRequired = false;
    var db = NsgLocalDb.instance;
    await db.init('nsg_template');
    await provider!.connect(this);

    super.onInit();
  }

  Future loadData() async {
    currentStatus = GetStatus.success(NsgBaseController.emptyData);
    sendNotify();
  }
}
