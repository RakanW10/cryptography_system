import 'package:cryptography_system/views/RSApage.dart';
import 'package:cryptography_system/views/homepage.dart';
import 'package:cryptography_system/views/splachScreen.dart';
import 'package:get/get.dart';

List<GetPage> routerApp = [
  GetPage(
    name: Routes.splachScreen,
    page: () => const SplachScreen(),
  ),
  GetPage(
    name: Routes.homepage,
    page: () => Homepage(),
  ),
  GetPage(
    name: Routes.RSAPage,
    page: () => const RSAPage(),
  ),
];

class Routes {
  static String splachScreen = "/splachScreen";
  static String homepage = "/homepage";
  static String RSAPage = "/RSAPage";
}
