import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/config/custom_textstyles.dart';
import 'package:weather_app/screens/landing_page/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.blue.shade200,
                  Colors.blue.shade400,
                  Colors.blue.shade600,
                  Colors.blue.shade800,
                ])),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.5),
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: CustomTextStyles.largeTextStyle(
                            textColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              hintText: 'Enter your email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.grey.shade500,
                              )),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            hintText: 'Enter your password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              splashColor: Colors.blue.shade800,
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade400,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        letterSpacing: .5),
                                  )),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Don\'t have an account?  ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage()));
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                cloudIcon(top2: 65, top: 75, left2: 30, left: 30),
                cloudIcon(bottom: 75, right: 30, right2: 30, bottom2: 85),
                cloudIcon(
                    top: 185,
                    top2: 185,
                    right: 0,
                    right2: 0,
                    height: 70,
                    width: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cloudIcon({
    double? bottom,
    double? left,
    double? right,
    double? top,
    double? bottom2,
    double? left2,
    double? right2,
    double? top2,
    double? height,
    double? width,
  }) {
    return Stack(
      children: [
        Positioned(
            top: top,
            left: left,
            bottom: bottom,
            right: right,
            child: SvgPicture.network(
              'https://www.svgimages.com/svg-image/s7/cloud.svg',
              height: height ?? 40,
              width: width ?? 40,
            )),
        Positioned(
            top: top2,
            left: left2,
            bottom: bottom2,
            right: right2,
            child: SvgPicture.network(
              'https://www.svgimages.com/svg-image/s7/cloud.svg',
              height: height ?? 40,
              width: width ?? 40,
            ))
      ],
    );
  }
}
