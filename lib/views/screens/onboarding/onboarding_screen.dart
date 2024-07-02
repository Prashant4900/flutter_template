import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/routes/router.dart';
import 'package:flutter_template/theme/theme_manager.dart';
import 'package:flutter_template/views/components/buttons.dart';
import 'package:go_router/go_router.dart';

class MyOnboardingScreen extends StatefulWidget {
  const MyOnboardingScreen({super.key});

  @override
  State<MyOnboardingScreen> createState() => _MyOnboardingScreenState();
}

class _MyOnboardingScreenState extends State<MyOnboardingScreen> {
  final PageController _controller = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentPageNotifier,
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(
            leading: value != 0
                ? GestureDetector(
                    onTap: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        horizontalMargin16,
                        InkWell(
                          child: Icon(Icons.adaptive.arrow_back, size: 18),
                        ),
                        horizontalMargin4,
                        Text(
                          context.lang.back,
                          style: context.bodyLarge,
                        ),
                      ],
                    ),
                  )
                : null,
            leadingWidth: 150,
            actions: [
              GestureDetector(
                onTap: () => context.pushReplacement(MyRoutes.logInScreen),
                child: Text(
                  context.lang.skip,
                  style: context.bodyLarge,
                ),
              ),
              horizontalMargin16,
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: (MediaQuery.of(context).size.height /
                              MediaQuery.of(context).size.width) >=
                          1.85
                      ? 440
                      : 340,
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (int page) =>
                        _currentPageNotifier.value = page,
                    children: [
                      OnboardingPage(
                        description: context.lang.onboardingTitle1,
                        currentPage: value,
                        image: 'image',
                      ),
                      OnboardingPage(
                        description: context.lang.onboardingTitle2,
                        currentPage: value,
                        image: 'image',
                      ),
                      OnboardingPage(
                        description: context.lang.onboardingTitle3,
                        currentPage: value,
                        image: 'image',
                      ),
                    ],
                  ),
                ),
                verticalMargin12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Indicator(
                      isActive: value == 0,
                    ),
                    Indicator(
                      isActive: value == 1,
                    ),
                    Indicator(
                      isActive: value == 2,
                    ),
                  ],
                ),
                const Spacer(flex: 3),
                Padding(
                  padding: horizontalPadding16,
                  child: CustomElevatedButton(
                    label: value != 2
                        ? context.lang.next
                        : context.lang.getStarted,
                    onPressed: () {
                      if (value != 2) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      } else {
                        context.pushReplacement(MyRoutes.logInScreen);
                      }
                    },
                  ),
                ),
                verticalMargin20,
              ],
            ),
          ),
        );
      },
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.description,
    required this.image,
    required this.currentPage,
    super.key,
  });

  final String description;
  final String image;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Assets.images.onboarding.image(
          height: (MediaQuery.of(context).size.height /
                      MediaQuery.of(context).size.width) >=
                  1.85
              ? 320
              : 140,
          fit: BoxFit.fill,
        ),
        Text(
          (MediaQuery.of(context).size.height /
                  MediaQuery.of(context).size.width)
              .toString(),
        ),
        verticalMargin24,
        Padding(
          padding: horizontalPadding16,
          child: Text(
            description,
            style: context.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({super.key, this.isActive = false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? context.colorScheme.primary : Colors.grey,
      ),
    );
  }
}
