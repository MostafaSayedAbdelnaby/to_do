import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:to_do/login/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "OnboardingScreen";

  const OnboardingScreen({super.key});

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bodyStyle = Theme.of(context).textTheme.titleSmall!.copyWith();
    var pageDecoration = PageDecoration(
      imageFlex: 2,
      titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
          ),
      bodyTextStyle: bodyStyle,
      pageColor: Theme.of(context).primaryColorLight,
      bodyPadding: const EdgeInsets.all(0),
      imagePadding: const EdgeInsets.symmetric(horizontal: 18),
    );

    return IntroductionScreen(
      globalHeader: Image.asset("assets/images/app_logo.png"),
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
        color: Theme.of(context).splashColor, // black
        activeColor: Theme.of(context).primaryColor,
      ),
      globalBackgroundColor: Theme.of(context).primaryColorLight,
      showDoneButton: true,
      next: Text("Next",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).primaryColor,
              )),
      showNextButton: true,
      done: Text("Done",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).primaryColor,
              )),
      onDone: () {
        /// change to pushAndRemoveUntil
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);

        /// If this page open once, it will not open again until I'm closed the project and Run
        // CacheHelper.safeEligibility();
      },
      showSkipButton: true,
      skip: Text("Skip",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).primaryColor,
              )),
      pages: [
        PageViewModel(
          title: "title_first".tr(),
          body: "onboarding_first".tr(),
          image: _buildImage('onboarding_bg1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "title_second".tr(),
          body: "onboarding_second".tr(),
          image: _buildImage('onboarding_bg2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "title_third".tr(),
          body: "onboarding_third".tr(),
          image: _buildImage('onboarding_bg3.png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}



// static Future<void> verifyPhoneNumber(
// String phoneNumber,
// Function onCodeSent,
// Function onError,
// ) async {
// FirebaseAuth.instance.verifyPhoneNumber(
// phoneNumber: phoneNumber,
// verificationCompleted: (PhoneAuthCredential credential) async {
// // Auto-retrieval of the code
// await FirebaseAuth.instance.signInWithCredential(credential);
// },
// verificationFailed: (FirebaseAuthException e) {
// onError(e.message!);
// },
// codeSent: (String verificationId, int? resendToken) {
// onCodeSent(verificationId);
// },
// codeAutoRetrievalTimeout: (String verificationId) {},
// );
// }
//
// static Future<void> signInWithPhoneNumber(
// String verificationId,
// String smsCode,
// Function onSuccess,
// Function onError,
// ) async {
// try {
// PhoneAuthCredential credential = PhoneAuthProvider.credential(
// verificationId: verificationId, smsCode: smsCode);
// await FirebaseAuth.instance.signInWithCredential(credential);
// onSuccess();
// } catch (e) {
// onError("Failed to sign in with phone number");
// }
// }
