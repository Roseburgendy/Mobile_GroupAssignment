import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_export.dart'; // 保留原有结构（使用 ThemeHelper、StyleHelper 等）

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'lizijing_s_application',
          debugShowCheckedModeBanner: false,

          /// ✅ 使用路由方式统一管理所有页面
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,

          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}
