import 'package:advanced_flutter_course/presentation/forgotPassword/forgot_password.dart';
import 'package:advanced_flutter_course/presentation/login/login.dart';
import 'package:advanced_flutter_course/presentation/main/main_view.dart';
import 'package:advanced_flutter_course/presentation/onboarding/onboarding.dart';
import 'package:advanced_flutter_course/presentation/register/register.dart';
import 'package:advanced_flutter_course/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_course/presentation/splash/splash.dart';
import 'package:advanced_flutter_course/presentation/store_details/store_details.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingROute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String forgotPasswordRoute = "/forgotPassword";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingROute:
        return MaterialPageRoute(builder: (_) =>  OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
