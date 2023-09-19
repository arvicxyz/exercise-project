import 'package:exercise_project/src/constants/dimens.dart';
import 'package:exercise_project/src/constants/styles.dart';
import 'package:exercise_project/src/features/home/view_models/home_view_model.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late HomeViewModel _viewModel;
  final TextEditingController _inputTextController = TextEditingController(text: "");

  @override
  void initState() {
    _viewModel = HomeViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second"),
      ),
      body: SafeArea(
        child: Padding(
          padding: kDefaultPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Please input a text to display on the third screen",
                style: kDefaultTextStyle,
              ),
              const SizedBox(height: kDefaultWidgetSpacing),
              TextField(
                controller: _inputTextController,
              ),
              const SizedBox(height: kDefaultWidgetSpacing),
              ElevatedButton(
                onPressed: () {
                  var inputText = _inputTextController.text;
                  setState(() {
                    _viewModel.setInputText(inputText);
                    _inputTextController.text = "";
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Text successfully set"),
                  ));
                },
                child: const Text(
                  "SUBMIT",
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
