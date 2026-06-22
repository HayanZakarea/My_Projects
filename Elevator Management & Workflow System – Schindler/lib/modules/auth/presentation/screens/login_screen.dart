import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/modules/auth/presentation/components/welcome_container.dart';
import 'package:elevator_management_app/modules/auth/presentation/screens/register_screen.dart';

import '../../../../core/core_components/app_text_form_field.dart';
import '../controller/login/login_binding.dart';
import '../controller/login/login_controller.dart';
import '../controller/login/login_middleware.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  static const name = '/';
  static final page = GetPage(
      name: name,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      middlewares: [
        LoginMiddleware()
      ]
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
              child: WelcomeContainer(
              )
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.vmin,
                  vertical: 5.vmin
                ).copyWith(
                  right: 10.w
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Login To Your Account",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                        ),
                    ),
                    SizedBox(
                      height: 5.vmin,
                    ),
                    AppTextFormField(
                      icon: Icon(Icons.email),
                      hint: 'Email',
                      controller: controller.emailController,
                    ),
                    SizedBox(
                      height: 2.5.vmin,
                    ),
                    AppTextFormField(
                      icon: Icon(Icons.password),
                      hint: 'Password',
                      isPass: true,
                      controller: controller.passwordController,
                    ),
                    SizedBox(
                      height: 5.vmin,
                    ),
                    SubmitButton(
                      onTap: controller.sendData,
                      label: "Login",
                    ),
                    SizedBox(
                      height: 1.5.vmin,
                    ),

                    // InkWell(
                    //   onTap: (){
                    //     Get.offAllNamed(RegisterScreen.name);
                    //   },
                    //   child: ShaderMask(
                    //       shaderCallback: (rect) => LinearGradient(
                    //           colors: [
                    //             Colors.blue.shade600,
                    //             Colors.blue.shade900,
                    //           ]
                    //       ).createShader(rect),
                    //       blendMode: BlendMode.srcATop,
                    //       child: Text(
                    //           "or register if you don't have an acount",
                    //           style: TextStyle(
                    //             fontSize: 13.sp
                    //           ),
                    //       ),
                    //   ),
                    // )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
