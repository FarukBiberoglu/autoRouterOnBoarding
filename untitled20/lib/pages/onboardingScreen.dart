import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:untitled20/route/app_router.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  final List<OnBoardingModel> list = [
    OnBoardingModel(
      title: 'Hoşgeldiniz',
      subTitle: 'Harika bir deneyime hazır olun!',
      icon: Icons.workspaces_filled,
      imagePath: 'assets/ob1.jpg',
    ),
    OnBoardingModel(
      title: 'Sürükleyici',
      subTitle: 'Sürükleyici bir deneyim!',
      icon: Icons.flourescent_rounded,
      imagePath: 'assets/ob2.jpg',
    ),
    OnBoardingModel(
      title: 'Kendinizi Geliştirin',
      subTitle:
      'Sağladığımız ayrıcalıklar ile siz de kariyerinizi bir adım öteye taşıyın!',
      icon: Icons.account_box_rounded,
      imagePath: 'assets/ob3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: list.length,
      onPageChanged: (value) {
        setState(() {
          currentPage = value;
        });
      },
      itemBuilder: (context, index) {
        final item = list[index];
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  const Color.fromARGB(31, 0, 0, 0),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(5),
                              backgroundColor: Colors.black.withOpacity(.6),
                            ),
                            onPressed: () {
                              context.router.replace(const HomeRoute());
                            },
                            child: Text(
                              'Geç',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        item.icon,
                        color: Colors.white,
                        size: 53,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white.withOpacity(1),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          item.subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 400,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                          ),
                          onPressed: () {
                            if (currentPage == list.length - 1) {
                              context.router.replace(const HomeRoute());
                            } else {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            }
                          },
                          child: const Text(
                            'Devam Et',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OnBoardingModel {
  final String title;
  final String subTitle;
  final IconData icon;
  final String imagePath;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.imagePath,
  });
}
