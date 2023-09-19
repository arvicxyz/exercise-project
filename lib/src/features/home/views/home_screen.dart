import 'package:exercise_project/src/constants/dimens.dart';
import 'package:exercise_project/src/constants/styles.dart';
import 'package:exercise_project/src/routing/app_route.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kDefaultPagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //  Perform an API call
                ElevatedButton(
                  onPressed: () {
                    AppRoute.navigate(
                      context,
                      AppRoute.firstRoute,
                    );
                  },
                  child: const Text(
                    "Button 1",
                    style: kButtonTextStyle,
                  ),
                ),
                const SizedBox(height: kDefaultWidgetSpacing),
                // Accept user input as a string
                ElevatedButton(
                  onPressed: () {
                    AppRoute.navigate(
                      context,
                      AppRoute.secondRoute,
                    );
                  },
                  child: const Text(
                    "Button 2",
                    style: kButtonTextStyle,
                  ),
                ),
                const SizedBox(height: kDefaultWidgetSpacing),
                // Display the reversed version of the string from Screen 2
                ElevatedButton(
                  onPressed: () {
                    AppRoute.navigate(
                      context,
                      AppRoute.thirdRoute,
                    );
                  },
                  child: const Text(
                    "Button 3",
                    style: kButtonTextStyle,
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
