import 'package:flutter/material.dart';
import 'package:to_do/firebase/firebase_manager.dart';
import 'package:to_do/login/login_screen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var rePasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey, // must be create formKey from GlobalKey<>
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // different between ImageIcon & Image.asset by features that i'm take for the image
                // ImageIcon(AssetImage(""),),
                Image.asset(
                  "assets/images/Logo.png",
                  width: double.infinity,
                  height: 150,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).focusColor,
                      ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    labelText: "Name",
                    labelStyle:
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).focusColor,
                            ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFF7B7B7B),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is Required";
                    }

                    final bool emailValid =
                        RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9]+@[gmail]+\.[com]+")
                            .hasMatch(value);

                    if (!emailValid) {
                      return "Email is Required with RegExp";
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).focusColor,
                      ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    labelText: "Email",
                    labelStyle:
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).focusColor,
                            ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xFF7B7B7B),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: false,
                  // to enable hiding of Password
                  obscuringCharacter: "#",
                  // if I'm hide Password by # without *
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is Required";
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 Char ";
                    }
                    if (passwordController.text != value) {
                      return "Password not matched ";
                    }

                    return null;
                  },
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).focusColor,
                      ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    labelText: "Password",
                    labelStyle:
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).focusColor,
                            ),
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      color: Color(0xFF7B7B7B),
                    ),
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Color(0xFF7B7B7B),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: rePasswordController,
                  obscureText: false,
                  // to enable hiding of Password
                  obscuringCharacter: "#",
                  // if I'm hide Password by # without *
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is Required";
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 Char ";
                    }
                    if (passwordController.text != value) {
                      return "Password not matched ";
                    }

                    return null;
                  },
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).focusColor,
                      ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                    ),
                    labelText: "Re Password",
                    labelStyle:
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).focusColor,
                            ),
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      color: Color(0xFF7B7B7B),
                    ),
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Color(0xFF7B7B7B),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // currentState means in the click state
                    if (formKey.currentState!.validate()) {
                      FirebaseManager.createUser(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                        // Function onSuccess()
                        () {
                          Navigator.pop(context); // to return after onSuccess
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginScreen.routeName,
                            (route) => false,
                          );
                        },
                        // Function onLoading()
                            () {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              backgroundColor: Colors.transparent,
                              title: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        },
                        // Function onError()
                        (message) {
                          Navigator.pop(context); // to return after onError
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("SomeTimes went wrong"),
                              content: Text(message),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // to return after "Ok"
                                    },
                                    child: Text(
                                      "Ok",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ))
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text("Create Account",
                      // "login".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white)),
                ),
                const SizedBox(height: 16),

                /// I'm changed InkWell to GestureDetector
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text: "Already Have Account ? ",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 14,
                                  )),
                      TextSpan(
                          text: "Login",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                // fontSize: 18,
                                color: Theme.of(context).primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColor,
                              )),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// class RegisterScreen extends StatelessWidget {
//   static const String routeName = "RegisterScreen";
//
//   RegisterScreen({super.key});
//
//   var formKey = GlobalKey<FormState>();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController smsCodeController = TextEditingController();
//   String? verificationId;
//   bool codeSent = false;
//
//   @override
//   Widget build(BuildContext context) {
//     var nameController = TextEditingController();
//     var emailController = TextEditingController();
//     var passwordController = TextEditingController();
//     var rePasswordController = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Register", style: Theme.of(context).textTheme.titleMedium),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Image.asset("assets/images/Logo.png", width: double.infinity, height: 150),
//                 const SizedBox(height: 24),
//                 // Other input fields for name, email, and password...
//
//                 if (!codeSent) ...[
//                   TextField(
//                     controller: phoneController,
//                     decoration: InputDecoration(labelText: "Phone Number"),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       FirebaseManager.loginWithPhoneNumber(
//                         phoneController.text,
//                             (String verificationId) {
//                           setState(() {
//                             this.verificationId = verificationId;
//                             codeSent = true; // Set codeSent to true
//                           });
//                         },
//                             (String message) {
//                           // Handle error
//                           showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               title: const Text("Error"),
//                               content: Text(message),
//                               actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
//                             ),
//                           );
//                         },
//                             () {
//                           // Successfully logged in
//                           Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
//                         },
//                       );
//                     },
//                     child: Text("Send Verification Code"),
//                   ),
//                 ] else ...[
//                   TextField(
//                     controller: smsCodeController,
//                     decoration: InputDecoration(labelText: "SMS Code"),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       FirebaseManager.signInWithPhoneNumber(
//                         verificationId!,
//                         smsCodeController.text,
//                             () {
//                           // Successfully registered
//                           Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
//                         },
//                             (String message) {
//                           // Handle error
//                           showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               title: const Text("Error"),
//                               content: Text(message),
//                               actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     child: Text("Verify SMS Code"),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }