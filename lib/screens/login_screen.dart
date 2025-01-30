import 'package:flutter/material.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/components/rounded_input_field.dart';
import 'package:flutter_app/components/square_box.dart';
import 'package:flutter_app/core/app_text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: 0.7,
              child: SvgPicture.asset(
                "assets/images/down.svg",
                width: 100,
                height: 100,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hoş Geldiniz",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(20),
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 200, 200, 200),
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
                            Text(
                              "Forgot Password?",
                              style: AppTextStyle.MINI_BOLD_DESCRIPTION_TEXT,
                            ),
                            RoundedButton(
                              text: "LOGİN",
                              press: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          indent: 50,
                          thickness: 0.5,
                          color: Colors.grey,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or Contunie with",
                            style: AppTextStyle.MINI_DESCRIPTION_TEXT,
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          indent: 50,
                          thickness: 0.5,
                          color: Colors.grey,
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareBox(
                        imagePath: "assets/logo/google (1).png",
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      SquareBox(
                        imagePath: "assets/logo/apple (3).png",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "not a member?",
                        style: AppTextStyle.MINI_DEFAULT_DESCRIPTION_TEXT,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          context.go("/register");
                        },
                        child: Text(
                          "Register Now",
                          style: AppTextStyle.MINI_DESCRIPTION_BOLD_TEXT,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
