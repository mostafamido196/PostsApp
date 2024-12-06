import 'package:get/get.dart';
import '../features/detail_screen/presentation/pages/detail_page.dart';
import '../features/list_screen/presentation/pages/list_page.dart';


class AppRoutes {
  static const String list = '/';
  static const String detail = '/detail';

  static List<GetPage> routes = [
    GetPage(name: list, page: () => ListPage()),
    GetPage(name: detail, page: () => DetailPage()),
  ];
}
