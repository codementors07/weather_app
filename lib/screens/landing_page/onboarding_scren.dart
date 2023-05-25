import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/config/asset_images.dart';
import 'package:weather_app/config/custom_textstyles.dart';
import '../../model/onboarding_model.dart';
import 'login_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int initialPage = 0;
  PageController? _pageController;

  changePage(int index) {
    initialPage = index;
    _pageController?.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                initialPage = value;
              });
            },
            itemCount: onboardingList.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Image.network(
                      onboardingList[index].imageTitle,
                      height: 150,
                      width: 155,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Image.asset(
                            AssetPath.weatherLogo,
                            height: 150,
                            width: 150,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 3.5,
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          onboardingList[index].title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 12.5,
                        ),
                        Text(
                          onboardingList[index].description,
                          style: CustomTextStyles.customTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              textColor: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  if (initialPage == 2) ...[
                    Positioned(
                      bottom: 25,
                      child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 80,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade800),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginPage()));
                              },
                              child: Text(
                                'Get Started',
                                style: CustomTextStyles.semilargeTextStyle(
                                    fontSize: 16),
                              ))),
                    )
                  ] else ...[
                    Positioned(
                      bottom: 25,
                      child: CarouselIndicator(
                        count: onboardingList.length,
                        index: initialPage,
                        activeColor: Colors.blue.shade900,
                        color: Colors.black45,
                        height: 10,
                        width: 10,
                        cornerRadius: 5,
                      ),
                    ),
                  ],
                  if (initialPage == 0) ...[
                    Positioned(
                      top: 50,
                      right: 30,
                      child: TextButton(
                          onPressed: () {
                            changePage(2);
                            print('object');
                            print(initialPage);
                          },
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Skip now',
                                style: CustomTextStyles.semilargeTextStyle(),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              )
                            ],
                          )),
                    ),
                  ] else ...[
                    const SizedBox()
                  ]
                ],
              );
            }));
  }
}
