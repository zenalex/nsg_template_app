import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';

import '../app_pages.dart';
import 'generated/data_controller.g.dart';
import 'options/server_options.dart';

class DataController extends DataControllerGenerated {
  //NsgPushNotificationService? nsgFirebase;

  DataController() : super() {
    requestOnInit = false;
    autoRepeate = true;
    autoRepeateCount = 1000;
  }

  @override
  Future onInit() async {
    provider ??= NsgDataProvider(
      applicationName: 'cognitive_trainings',
      firebaseToken: '',
      applicationVersion: '',
      availableServers: NsgServerOptions.availableServers,
      // Провайдер больше не хранит виджеты логина — он лишь просит их показать.
      eventOpenLoginPage: () async => await NsgNavigator.push(Routes.loginPage),
    );
    //firebaseToken: nsgFirebase == null ? '' : nsgFirebase!.firebasetoken);
    provider!.useNsgAuthorization = false;
    await super.onInit();
  }

  @override
  Future loadProviderData() async {
    await super.loadProviderData();
    status = GetStatus.success(NsgBaseController.emptyData);
    _gotoMainPage();
  }

  bool _animationFinished = false;
  void splashAnimationFinished() {
    _animationFinished = true;
    _gotoMainPage();
  }

  bool gotoDone = false;
  void _gotoMainPage() {
    if (_animationFinished && status.isSuccess && !gotoDone) {
      gotoDone = true;
      Get.offAndToNamed(Routes.mainPage);
    }
  }
}
