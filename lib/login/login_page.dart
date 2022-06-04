import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsg_controls/nsg_button.dart';
import 'package:nsg_data/nsg_data.dart';

import 'login_params.dart';

class LoginPage extends NsgPhoneLoginPage {
  LoginPage(NsgDataProvider provider) : super(provider, widgetParams: LoginPage.getWidgetParams());

  @override
  Widget getLogo() {
    const List<String> _images = <String>[
      'lib/ssets/images/sv1.svg',
      'lib/assets/images/sv2.svg',
      'lib/assets/images/sv3.svg',
      'lib/assets/images/sv4.svg',
      'lib/assets/images/logo.svg'
    ];
    var logo = Center(
        child: Transform.translate(
            offset: const Offset(0, -50),
            child: Transform.scale(
              scale: 2,
              child: Stack(
                children: [
                  SvgPicture.asset(_images[0]),
                  Transform.translate(offset: const Offset(13.5, 26), child: SvgPicture.asset(_images[1])),
                  Transform.translate(offset: const Offset(10, 10), child: SvgPicture.asset(_images[2])),
                  Transform.translate(offset: const Offset(37, 0), child: SvgPicture.asset(_images[3])),
                  Transform.translate(offset: const Offset(0, 80), child: SvgPicture.asset(_images[4]))
                ],
              ),
            )));

    return logo;
  }

  @override
  Widget getBackground() {
    var background = const Image(
      image: AssetImage('/assets/images/titan-back.png'),
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
