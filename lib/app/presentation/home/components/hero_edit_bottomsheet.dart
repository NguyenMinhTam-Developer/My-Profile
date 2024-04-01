// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../layouts/default_bottom_sheet_layout.dart';

class HeroEditBottomSheet extends StatefulWidget {
  static show() => Get.bottomSheet(
        const HeroEditBottomSheet._(),
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
      );

  const HeroEditBottomSheet._();

  @override
  State<HeroEditBottomSheet> createState() => _HeroEditBottomSheetState();
}

class _HeroEditBottomSheetState extends State<HeroEditBottomSheet> {
  final controller = Get.find<HomePageController>();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  Future<void> _onSave() async {
    if (_formKey.currentState!.saveAndValidate()) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        firstName: _formKey.currentState!.fields['firstName']!.value as String,
        lastName: _formKey.currentState!.fields['lastName']!.value as String,
        description: _formKey.currentState!.fields['description']!.value as String,
        location: _formKey.currentState!.fields['location']!.value as String,
        email: _formKey.currentState!.fields['email']!.value as String,
        phone: _formKey.currentState!.fields['phone']!.value as String,
      );

      Get.back();

      controller.updateUser();
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit Profile Information",
      content: FormBuilder(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'firstName',
                      initialValue: controller.currentUser.value.firstName,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'lastName',
                      initialValue: controller.currentUser.value.lastName,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'description',
                initialValue: controller.currentUser.value.description,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                minLines: 10,
                maxLines: 10,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'location',
                initialValue: controller.currentUser.value.location,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'email',
                initialValue: controller.currentUser.value.email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(),
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'phone',
                initialValue: controller.currentUser.value.phone,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
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
