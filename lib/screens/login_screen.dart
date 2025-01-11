import 'package:flutter/material.dart';
import 'package:to_do/screens/forget_password.dart';
import 'package:to_do/screens/home/home.dart';
import 'package:to_do/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
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
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
              },
              child: Text(
                "Forget Password?",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).primaryColor,
                    ),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text("Login",
                  // "login".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
            ),
            const SizedBox(height: 24),
            InkWell(
             onTap: (){
               Navigator.pushNamed(context, RegisterScreen.routeName);
             },
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                      text: "Don’t Have Account ? ",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                      )),
                  TextSpan(
                      text: "Create Account",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            // fontSize: 18,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor,
                          ),),
                ]),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(
                     indent: 40,
                    endIndent: 10,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "Or",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 10,
                    endIndent: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/image_google.png"),
                  const SizedBox(width: 8,),
                  Text("Login With Google",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
