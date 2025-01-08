import 'package:flutter/material.dart';
import 'package:to_do/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var rePasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            TextField(
              controller: nameController,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).focusColor,
                  ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                labelText: "Name",
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).focusColor,
                    ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color(0xFF7B7B7B),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).focusColor,
                  ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                labelText: "Email",
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).focusColor,
                    ),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Color(0xFF7B7B7B),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              // to enable hiding of Password
              obscuringCharacter: "#",
              // if I'm hide Password by # without *
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).focusColor,
                  ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                labelText: "Password",
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
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
            TextField(
              controller: rePasswordController,
              obscureText: true,
              // to enable hiding of Password
              obscuringCharacter: "#",
              // if I'm hide Password by # without *
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).focusColor,
                  ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                ),
                labelText: "Re Password",
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                // Navigator.pushNamed(context, LoginScreen.routeName);
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
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                      text: "Already Have Account ? ",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14,
                          )),
                  TextSpan(
                      text: "Login",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
    );
  }
}
