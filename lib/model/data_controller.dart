import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:nsg_template_app/login/login_params.dart';

import '../app_pages.dart';
import 'generated/data_controller.g.dart';

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

      widgetLoginParams: () => LoginParams(),
      availableServers: NsgServerParams(
          {'https://localhost': 'main', 'https://localhost:5001': 'test'},
          'https://localhost'),
      // eventOpenLoginPage: openLoginPage,
      // languageCode: FutbolistaApp.defaultLocale.languageCode,
      // availableServers: NsgServerOptions.availableServers
    );
    //firebaseToken: nsgFirebase == null ? '' : nsgFirebase!.firebasetoken);
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
