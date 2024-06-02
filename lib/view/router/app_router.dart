import 'package:coffee/view/cart/cart_screen.dart';
import 'package:coffee/view/home/home_screen.dart';
import 'package:coffee/view/onboarding/onboarding_screen.dart';
import 'package:coffee/view/show_details/show_details_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  static List<GetPage> getPages() {
    return [
      GetPage(name: RoutesNames.onBoarding, page: () => OnBoardingScreen()),
      GetPage(name: RoutesNames.home, page: () => HomeScreen()),
      GetPage(name: RoutesNames.showDetails, page: () => ShowDetailsScreen()),
      GetPage(name: RoutesNames.cart, page: () => CartScreen()),
    ];
  }
}

class RoutesNames {
  static const String home = '/HOME';
  static const String onBoarding = '/BOARDING';
  static const String showDetails = '/SHOW_DETAILS';
  static const String cart = '/CART';
}
