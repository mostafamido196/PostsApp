import 'package:codenesslab/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/app_binding.dart';
import 'core/theme/app_theme.dart';
import 'features/list_screen/presentation/pages/list_page.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // App configuration
      title: 'Your App Name',
      debugShowCheckedModeBanner: false,

      // Theming
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Respects system theme settings

      // Responsive design
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),

      // Routing
      initialBinding: AppBinding(), // Register global bindings
      initialRoute: AppRoutes.list, // Starting route
      getPages: AppRoutes.routes, // Define app routes

      // Localization (optional)
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),

      // Error handling
      enableLog: true, // GetX logging
    );
  }
}