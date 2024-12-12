import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 0,
            child: Opacity(
                opacity: 0.7,
                child: SvgPicture.asset(
                  "assets/images/up.svg",
                  width: 200,
                  height: 200,
                ))),
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            SvgPicture.asset(
              "assets/images/welcome.svg",
              width: 200,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(20),
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 200, 200),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      RoundedInputField(
                        hinText: "Mailiniz",
                        icon: Icons.mail,
                        onChange: (value) {},
                        isEmail: true,
                        isPassword: false,
                      ),
                      RoundedInputField(
                        hinText: "Şifreniz",
                        icon: Icons.lock,
                        onChange: (value) {},
                        isEmail: false,
                        isPassword: true,
                      ),
                      InkWell(
                        onTap: () => context.go("/home"),
                        child: SizedBox(
                          width: 100,
                          child: DotLottieLoader.fromAsset(
                              "assets/motions/login.lottie", frameBuilder:
                                  (BuildContext ctx, DotLottie? dotlottie) {
                            if (dotlottie != null) {
                              return Lottie.memory(
                                  dotlottie.animations.values.single);
                            } else {
                              return Container();
                            }
                          }),
                        ),
                      ),
                    ],
                  )),
            ])
          ],
        ),
        Positioned(
            bottom: 0,
            child: Opacity(
                opacity: 0.7,
                child: SvgPicture.asset(
                  "assets/images/down.svg",
                  width: 100,
                  height: 100,
                ))),
      ],
    ));
  }
}
