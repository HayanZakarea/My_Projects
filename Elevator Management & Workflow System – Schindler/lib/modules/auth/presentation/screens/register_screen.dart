// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:elevator_management_app/core/core_components/submit_button.dart';
// import 'package:elevator_management_app/modules/auth/presentation/components/welcome_container.dart';
//
// import '../../../../core/core_components/app_text_form_field.dart';
// import '../controller/register/register_blinding.dart';
// import '../controller/register/register_controller.dart';
//
// class RegisterScreen extends GetView<RegisterController> {
//   const RegisterScreen({super.key});
//
//   static const name = '/register';
//   static final page = GetPage(
//       name: name,
//       page: () => const RegisterScreen(),
//       binding: RegisterBinding()
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           const Expanded(
//               child: WelcomeContainer(
//
//               )
//           ),
//           Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 5.vmin,
//                     vertical: 5.vmin
//                 ).copyWith(
//                     right: 10.w
//                 ),
//                 child: Form(
//                   key: controller.formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Creat New Account",
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline
//                         ),
//                       ),
//
//                       SizedBox(
//                         height: 2.5.vmin,
//                       ),
//                       Row(
//                         children: [
//                           AppTextFormField(
//                             icon: Icon(Icons.person),
//                             hint: 'First Name',
//                             controller: controller.firstController,
//                             validator: (value){
//                               if(value == null || value.isEmpty){
//                                 return 'first name is required';
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             width: 2.5.vmin,
//                           ),
//                           AppTextFormField(
//                             icon: Icon(Icons.person),
//                             hint: 'Last Name',
//                             controller: controller.lastController,
//                           ),
//                         ].map(
//                                 (e) => e is SizedBox ? e: Expanded(child: e)
//                         ).toList(),
//                       ),
//                       SizedBox(
//                         height: 2.5.vmin,
//                       ),
//                       AppTextFormField(
//                         icon: Icon(Icons.email),
//                         hint: 'Email',
//                         controller: controller.emailController,
//                       ),
//                       SizedBox(
//                         height: 2.5.vmin,
//                       ),
//                       AppTextFormField(
//                         icon: Icon(Icons.password),
//                         hint: 'Password',
//                         isPass: true,
//                         controller: controller.passwordController,
//                       ),
//                       SizedBox(
//                         height: 2.5.vmin,
//                       ),
//                       AppTextFormField(
//                         icon: Icon(Icons.password),
//                         hint: 'Confirm PassWord',
//                         isPass: true,
//                         controller: controller.confirmPasswordController,
//                       ),
//
//                       SizedBox(
//                         height: 5.vmin,
//                       ),
//                       SubmitButton(
//                         onTap: controller.sendData,
//                         label: "create account",
//                       ),
//                       SizedBox(
//                         height: 2.5.vmin,
//                       ),
//
//                     ],
//                   ),
//                 ),
//               )
//           )
//         ],
//       ),
//     );
//   }
// }
