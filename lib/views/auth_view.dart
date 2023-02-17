
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laclassroom/utils/themes/dark_theme.dart';
import 'package:laclassroom/utils/themes/palette.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: mainGradient(context)
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 45,
              right: 0,
              left: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 6),
                child: Material(
                  borderRadius: BorderRadius.circular(6),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/google.svg", width: 16, height: 16,),
                          const SizedBox(width: 16,),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                              color: primaryDarkColorDark,
                              fontSize: getValueForScreenType(context: context, mobile: 16, tablet: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "LACLASSROOM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getValueForScreenType(context: context, mobile: 24, tablet: 26),
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}