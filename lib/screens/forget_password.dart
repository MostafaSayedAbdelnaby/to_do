import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "ForgetPasswordScreen";

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password",style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // different between ImageIcon & Image.asset by features that i'm take for the image
            // ImageIcon(AssetImage(""),),
            Image.asset(
              "assets/images/forget_bg.png",
              width: double.infinity,
              height: 360,
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
              child: Text("Reset Password",
                  // "login".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
