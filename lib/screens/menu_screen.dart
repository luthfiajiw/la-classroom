import 'package:flutter/material.dart';
import 'package:laclassroom/controllers/auth/auth_controller.dart';
import 'package:laclassroom/controllers/shared/theme_controller.dart';
import 'package:laclassroom/utils/themes/palette.dart';
import 'package:laclassroom/utils/themes/ui_parameters.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MenuScreen extends StatelessWidget {
  final VoidCallback? onClose;
  
  MenuScreen({super.key, this.onClose});

  final List<MenuItem> menuItems1 = [
    MenuItem(Icons.face_rounded, "Profile"),
    MenuItem(Icons.local_library_rounded, "Courses"),
    MenuItem(Icons.history_edu_rounded, "Papers"),
    MenuItem(Icons.confirmation_num_rounded, "Vouchers"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: mainGradient(context)
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<AuthController>(
                    builder: (context, value, _) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8, left: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(.9),
                              radius: getValueForScreenType(context: context, mobile: 30, tablet: 35),
                              backgroundImage: value.auth.currentUser?.photoURL == null
                              ? const NetworkImage("https://cdn-icons-png.flaticon.com/512/2102/2102647.png")
                              : NetworkImage(value.auth.currentUser!.photoURL!)
                            ),
                            const SizedBox(width: 12,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.auth.currentUser?.displayName ?? "-",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: getValueForScreenType(context: context, mobile: 16, tablet: 18)
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    value.auth.currentUser?.email ?? "-",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getValueForScreenType(context: context, mobile: 14, tablet: 16)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                              clipBehavior: Clip.hardEdge,
                              child: IconButton(
                                onPressed: onClose,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: getValueForScreenType(context: context, mobile: 24, tablet: 26),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 32,),
                  Column(
                    children: List.generate(menuItems1.length, (index) {
                      MenuItem menu = menuItems1[index];

                      return Material(
                        color: Colors.transparent,
                        child: ListTile(
                          onTap: () {},
                          contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
                          leading: Icon(
                            menu.icon,
                            color: Colors.white,
                            size: getValueForScreenType(context: context, mobile: 24, tablet: 26),
                          ),
                          title: Text(
                            menu.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: getValueForScreenType(context: context, mobile: 16, tablet: 18)
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Consumer<ThemeController>(
                      builder: (context, theme, child) {
                        return Row(
                          children: [
                            Icon(
                              UIParameters.isDarkMode(context) ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                              color: Colors.white,
                              size: getValueForScreenType(context: context, mobile: 24, tablet: 26),
                            ),
                            const SizedBox(width: 18,),
                            Switch(
                              value: UIParameters.isDarkMode(context),
                              activeColor: Colors.white,
                              onChanged: (value) => theme.toggleTheme(value)
                            )
                          ],
                        );
                      }
                    ),
                  ),
                  Consumer<AuthController>(
                    builder: (context, value, _) {
                      return Material(
                        color: Colors.transparent,
                        child: ListTile(
                          onTap: () => value.signOut(context),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
                          leading: Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                            size: getValueForScreenType(context: context, mobile: 24, tablet: 26),
                          ),
                          title: Text(
                            "Log Out",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: getValueForScreenType(context: context, mobile: 16, tablet: 18)
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  IconData icon;
  String name;

  MenuItem(this.icon, this.name);
}