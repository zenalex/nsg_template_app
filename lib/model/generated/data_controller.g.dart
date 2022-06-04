import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';

class DataControllerGenerated extends NsgBaseController {
  NsgDataProvider? provider;
  @override
  Future onInit() async {
    provider ??= NsgDataProvider(applicationName: 'tech_control', firebaseToken: '');
    provider!.serverUri = 'http://alex.nsgsoft.ru:5073';

    provider!.useNsgAuthorization = true;
    await provider!.connect(this);
    if (provider!.isAnonymous) {
      await Get.to(provider!.loginPage)?.then((value) => loadData());
    } else {
      await loadData();
    }

    super.onInit();
  }

  Future loadData() async {
    currentStatus = RxStatus.success();
    sendNotify();
  }
}
