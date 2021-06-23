import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topContainerHeight = size.height * 0.35;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              width: double.infinity,
              height: topContainerHeight,
            ),
            Positioned(
              top: topContainerHeight / 5,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.person,
                    width: 208,
                    height: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(AppImages.logomini),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 20),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      textAlign: TextAlign.center,
                      style: TextStyles.titleHome,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: SocialLoginButton(onTap: () {
                      controller.googleSignIn(context);
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
