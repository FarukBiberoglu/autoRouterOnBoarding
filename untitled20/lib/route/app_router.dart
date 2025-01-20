import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:untitled20/pages/home_page.dart';
import 'package:untitled20/pages/onboardingScreen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [


    AutoRoute(page: OnBoardingRoute.page,initial: true),
    AutoRoute(page: HomeRoute.page),



  ];
}

final router = AppRouter();