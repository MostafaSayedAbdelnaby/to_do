import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:to_do/screens/onboarding_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'introduction';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(
        context); // create object provider from MyProvider to used in ThemeMode & listen on ThemeMode
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/app_logo.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/introduction_header.png",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 26),
              Text(
                /// two methods to get text from { ar.json & en.json } by call the key
                // context.tr("introduction_title"),
                "introduction_title".tr(), // it's the better
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(height: 26),
              Text(
                "introduction_desc".tr(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("language".tr(),
                      style: Theme.of(context).textTheme.titleMedium),
                  ToggleSwitch(
                    minWidth: 73.0,
                    minHeight: 30.0,
                    // if I'm clicked on "en" icon this it's light
                    // if I'm clicked on "ar" icon this it's light
                    initialLabelIndex: context.locale.toString() == "en" ? 0 : 1,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: [
                      FontAwesomeIcons.flagUsa,
                      MdiIcons.abjadArabic,
                    ],
                    iconSize: 30.0,
                    activeBgColors: [
                      [
                        Theme.of(context).primaryColor,
                        Theme.of(context).secondaryHeaderColor
                      ],
                      const [Colors.yellow, Colors.orange]
                    ],
                    animate: true,
                    // with just animate set to true, default curve = Curves.easeIn
                    curve: Curves.bounceInOut,
                    // animate must be set to true when using custom curve
                    onToggle: (index) {
                      if (index == 1) {
                        context.setLocale(const Locale('ar'));
                      } else {
                        context.setLocale(const Locale('en'));
                      }
                      // print('switched to: $index');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("theme".tr(),
                      style: Theme.of(context).textTheme.titleMedium),
                  ToggleSwitch(
                    minWidth: 73.0,
                    minHeight: 30.0,
                    initialLabelIndex:
                        provider.themeMode == ThemeMode.light ? 0 : 1,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: const [
                      FontAwesomeIcons.sun,
                      FontAwesomeIcons.moon,
                    ],
                    iconSize: 30.0,
                    activeBgColors: [
                      [
                        Theme.of(context).primaryColor,
                        Theme.of(context).secondaryHeaderColor
                      ],
                      const [Colors.yellow, Colors.orange]
                    ],
                    animate: true,
                    // with just animate set to true, default curve = Curves.easeIn
                    curve: Curves.bounceInOut,
                    // animate must be set to true when using custom curve
                    onToggle: (index) {
                      provider.changeTheme();
                      // print('switched to: $index');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OnboardingScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Theme.of(context).primaryColor),
                child: Text("lets_Start".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
