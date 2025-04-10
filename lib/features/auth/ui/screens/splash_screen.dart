import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/app_configs.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/auth/ui/widget/app_logo.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainBottomNavBar.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const AppLogo(),
              const Spacer(),
              const CircularProgressIndicator(color: AppColors.themeColor),
              const SizedBox(height: 16),
              Text('${context.localization.version} ${AppConfigs.currentVersion}'),
            ],
          ),
        ),
      ),
    );
  }
}
