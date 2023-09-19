import 'package:exercise_project/src/constants/dimens.dart';
import 'package:exercise_project/src/constants/styles.dart';
import 'package:exercise_project/src/features/home/view_models/home_view_model.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late HomeViewModel _viewModel;
  late String _reversedString;

  @override
  void initState() {
    _viewModel = HomeViewModel();
    _reversedString = _viewModel.reverseString(_viewModel.getInputText() ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third"),
      ),
      body: SafeArea(
        child: Padding(
          padding: kDefaultPagePadding,
          child: Center(
            child: Text(
              _reversedString,
              style: kLargeTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
