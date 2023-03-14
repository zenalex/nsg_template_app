import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';

import '../app_pages.dart';
import '../../../login/login_page.dart';
import '../../../login/verification_page.dart';
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
    if (provider == null) {
      provider = NsgDataProvider(
          applicationName: 'cognitive_trainings',
          firebaseToken: '',
          applicationVersion: '');
      //firebaseToken: nsgFirebase == null ? '' : nsgFirebase!.firebasetoken);
      provider!.getLoginWidget = (provider) => LoginPage(provider);
      provider!.getVerificationWidget =
          (provider) => VerificationPage(provider);
    }
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
