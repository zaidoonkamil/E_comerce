import 'package:e_comerce_app/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/app_text.dart';

class WelcomeScreen extends StatelessWidget {
  final String imagePath = "assets/images/welcome_image.png";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor:primaryColor,
          body: Container(
            padding:const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                 const Spacer(),
                  icon(),
                  const SizedBox(
                    height: 20,
                  ),
                  welcomeTextWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  sloganText(),
                  const SizedBox(
                    height: 30,
                  ),
                  getButton(context),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget icon() {
    String iconPath = "assets/icons/order_accepted_icon.svg";
    return SvgPicture.asset(
      iconPath,
      width: 46,
      height: 86,
    );
  }

  Widget welcomeTextWidget() {
    return Column(
      children: [
        AppText(
          text: "Welcome",
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        AppText(
          text: "to our store",
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget sloganText() {
    return AppText(
      text: "Get your grecories as fast as in hour",
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: whiteColor,
    );
  }

  Widget getButton(BuildContext context) {
    return CustomButon(
      text: "Get Started",
      fontWeight: FontWeight.w600,
      onTap: () {
        onGetStartedClicked(context);
      },
      color: Colors.white,
      fontSize:16,
      fontweight: FontWeight.bold,
    );
  }

  void onGetStartedClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) {
        return  LoginPage();
      },
    ));
  }
}
