import 'package:flutter/material.dart';
import 'package:nsg_controls/nsg_button.dart';
import 'package:nsg_data/nsg_data.dart';

import 'login_params.dart';

class LoginPage extends NsgPhoneLoginPage {
  LoginPage(NsgDataProvider provider, {super.key})
      : super(provider, widgetParams: LoginPage.getWidgetParams());

  @override
  Widget getLogo() {
    var logo = Center(
        child: Transform.translate(
            offset: const Offset(0, -50),
            child: Transform.scale(
              scale: 2,
              child: Stack(
                children: [Image.asset('lib/assets/images/logo.png')],
              ),
            )));

    return logo;
  }

  @override
  Image getBackground() {
    var background = const Image(
      image: AssetImage('lib/assets/images/background.jpg'),
      fit: BoxFit.fill,
    );
    return background;
  }

  @override
  Widget getButtons() {
    return NsgButton(
      onPressed: () {
        sendData();
      },
      text: 'Получить СМС'.toUpperCase(),
    );
  }

  @override
  AppBar getAppBar(BuildContext context) {
    return AppBar(title: Text('Регистрация'.toUpperCase()), centerTitle: true);
  }

  static NsgPhoneLoginParams getWidgetParams() {
    return LoginParams();
  }
}
