import 'package:flutter/material.dart';
import 'package:laclassroom/controllers/auth/auth_controller.dart';
import 'package:laclassroom/utils/routes/route_paths.dart';
import 'package:laclassroom/utils/themes/palette.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Provider.of<AuthController>(context, listen: false).initAuth();
      Navigator.of(context).pushReplacementNamed(RoutePaths.introduction);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset(
          "assets/images/app_splash_logo.png",
          width: 125,
          height: 125,
        ),
      ),
    );
  }
}