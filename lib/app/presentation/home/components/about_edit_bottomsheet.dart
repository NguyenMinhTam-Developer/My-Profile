// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../layouts/default_bottom_sheet_layout.dart';

class AboutEditBottomSheet extends StatefulWidget {
  static show() => Get.bottomSheet(
        const AboutEditBottomSheet._(),
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
      );

  const AboutEditBottomSheet._();

  @override
  State<AboutEditBottomSheet> createState() => _AboutEditBottomSheetState();
}

class _AboutEditBottomSheetState extends State<AboutEditBottomSheet> {
  final controller = Get.find<HomePageController>();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  Future<void> _onSave() async {
    if (_formKey.currentState!.saveAndValidate()) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        aboutMe: _formKey.currentState!.fields['aboutMe']!.value as String,
      );

      Get.back();

      await controller.updateUser();
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit About",
      content: FormBuilder(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilderTextField(
                name: 'aboutMe',
                initialValue: controller.currentUser.value.aboutMe,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                minLines: 10,
                maxLines: 20,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
            ],
          ),
        ),
      ),
      action: FilledButton(
        onPressed: _onSave,
        child: const Text("Save"),
      ),
    );
  }
}
