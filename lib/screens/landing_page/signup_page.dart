import 'package:flutter/material.dart';

import '../../config/custom_textstyles.dart';
import '../../widget/cloud_icon.dart';
import '../home_page.dart';

// clean code architecture
//MVC :- Model view controller
//MVVM :- Model view- view model architecture

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  //make same as login

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
                  height: MediaQuery.of(context).size.height / 1.5,
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
                          'Signup',
                          style: CustomTextStyles.largeTextStyle(
                            textColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              hintText: 'Enter your fullname',
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Colors.grey.shade500,
                              )),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              hintText: 'Enter your number',
                              prefixIcon: Icon(
                                Icons.phone_android_outlined,
                                color: Colors.grey.shade500,
                              )),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
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
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                                (Route<dynamic> route) => false);
                          },
                          splashColor: Colors.blue.shade800,
                          child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade400,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Text(
                                'Signup',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: .5),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                cloudIcon(top2: 65, top: 75, left2: 30, left: 30),
                cloudIcon(bottom: 75, right: 30, right2: 30, bottom2: 85),
                cloudIcon(
                    top: 95,
                    top2: 95,
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
}
