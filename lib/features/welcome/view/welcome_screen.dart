import 'package:courses_eshop_app/features/welcome/provider/welcome_notifier.dart';
import 'package:courses_eshop_app/features/welcome/view/widgets/widgets.dart';
import 'package:courses_eshop_app/gen/assets.gen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class WelcomeScreen extends ConsumerWidget {
  static const kRoute = '/';

  WelcomeScreen({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  children: [
                    AppOnboardingPageWidget(
                        controller: _controller,
                        img: Assets.images.reading.path,
                        title: 'First see Learning',
                        subtitle: 'Forget about of paper all knowledge in one learning',
                        index: 1,
                        context: context),
                    AppOnboardingPageWidget(
                      controller: _controller,
                      img: Assets.images.man.path,
                      title: 'Connect With Everyone',
                      subtitle: 'Always keep in touch with your tutor and friends',
                      index: 2,
                      context: context,
                    ),
                    AppOnboardingPageWidget(
                        controller: _controller,
                        img: Assets.images.boy.path,
                        title: 'Always Fascinated Learning',
                        subtitle: 'Anywhere, anytime. The time is at your discretion. So study wherever you can.',
                        index: 3,
                        context: context),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    onTap: (index) {
                      _controller.animateToPage(index, duration: kThemeAnimationDuration, curve: Curves.linear);
                    },
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9),
                      activeSize: const Size(24, 8),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
