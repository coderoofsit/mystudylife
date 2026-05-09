import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_theme.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class MyStudyLifeApp extends StatelessWidget {
  const MyStudyLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Success Road',
      theme: buildAppTheme(),
      initialRoute: AppRoutes.privacy,
      getPages: AppPages.pages,
      builder: (context, child) {
        final media = MediaQuery.of(context);
        final width = media.size.width;
        final textScale = (width / 390).clamp(0.86, 1.08);
        return MediaQuery(
          data: media.copyWith(textScaler: TextScaler.linear(textScale)),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
