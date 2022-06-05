import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';

import '../app_pages.dart';
import '../model/data_controller.dart';

const List<String> _images = <String>[
  'lib/assets/images/sv1.svg',
  'lib/assets/images/sv2.svg',
  'lib/assets/images/sv3.svg',
  'lib/assets/images/sv4.svg',
  'lib/assets/images/logo.svg'
];

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double>

      ///
      _scale1,
      _scale2,
      _opacity,
      _opacity1,
      _opacity2,
      _opacity3,
      _opacity4,
      _opacity5,
      _rotate1,
      _translate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _opacity1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.2, curve: Curves.easeOut),
      ),
    );

    _opacity = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 1.0)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 95),
      TweenSequenceItem(
          //  tween: Tween(begin: 1.0, end: 0.0)
          tween: Tween(begin: 1.0, end: 1.0)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 5)
    ]).animate((CurvedAnimation(
        parent: _controller, curve: const Interval(0.0, 1.0))));

    _opacity2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
      ),
    );
    _opacity3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.4, curve: Curves.easeOut),
      ),
    );
    _opacity4 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.6, curve: Curves.easeOut),
      ),
    );
    _opacity5 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeOut),
      ),
    );
    _translate = Tween(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.5, curve: Curves.easeInOut),
      ),
    );
    _rotate1 = Tween(begin: 0.0, end: 8.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeInOut),
      ),
    );
    _scale1 = Tween(begin: 2.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeInOut),
      ),
    );
    _scale2 = Tween(begin: 5.0, end: 3.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        var controller = Get.find<DataController>();
        controller.splashAnimationFinished();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DataController>();
    return Scaffold(
      body: AnimatedBuilder(
        animation: _translate,
        builder: (ctx, ch) => Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: FadeTransition(
                    opacity: _opacity,
                    child: Transform.scale(
                      scale: _scale2.value,
                      child: Transform.translate(
                        offset: const Offset(0, -10),
                        child: Stack(
                          children: [
                            Transform.rotate(
                                angle: _rotate1.value,
                                child: FadeTransition(
                                  opacity: _opacity1,
                                  child: SvgPicture.asset(_images[0]),
                                )),
                            Transform.translate(
                                offset: const Offset(13.5, 26),
                                child: FadeTransition(
                                  opacity: _opacity3,
                                  child: SvgPicture.asset(_images[1]),
                                )),
                            Transform.translate(
                                offset: const Offset(10, 10),
                                child: FadeTransition(
                                  opacity: _opacity4,
                                  child: SvgPicture.asset(_images[2]),
                                )),
                            Transform.translate(
                                offset: const Offset(37, 0),
                                child: Transform.scale(
                                  scale: _scale1.value,
                                  child: FadeTransition(
                                    opacity: _opacity2,
                                    child: SvgPicture.asset(_images[3]),
                                  ),
                                )),
                            Transform.translate(
                                offset: Offset(0, 60 + _opacity5.value * 20),
                                child: FadeTransition(
                                  opacity: _opacity5,
                                  child: SvgPicture.asset(_images[4]),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              controller.obx(
                (state) => const SizedBox(),
                onLoading: FadeIn(
                  duration:
                      Duration(milliseconds: ControlOptions.instance.fadeSpeed),
                  curve: Curves.easeIn,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text(
                      'Подключение к серверу...',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onError: (s) => FadeIn(
                  duration:
                      Duration(milliseconds: ControlOptions.instance.fadeSpeed),
                  curve: Curves.easeIn,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline,
                            color: ControlOptions.instance.colorWarning),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            'Проверьте интернет соединение',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _controller.reset();
          Get.toNamed(Routes.mainPage);
        },
      ),
    );
  }
}
