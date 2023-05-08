import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:streamline/utils/colors.dart';
import 'package:streamline/widgets/custom_button.dart';
import 'package:streamline/widgets/custom_textfield.dart';

class GoLiveScreen extends StatefulWidget {
  const GoLiveScreen({super.key});
  @override
  State<GoLiveScreen> createState() => _GoLiveScreenState();
}

class _GoLiveScreenState extends State<GoLiveScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 22.0, vertical: 20.0),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  color: buttonColor,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: buttonColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_open,
                          color: buttonColor,
                          size: 40,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Select your thumbnail',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextField(
                      controller: _titleController,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 370, 10, 50),
          child: CustomButton(
            text: 'Go Live!',
            onTap: (() {}),
          ),
        ),
      ],
    ));
  }
}
