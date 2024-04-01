import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../configs/constants/sizes.dart';
import '../../../../../configs/routes/route_name.dart';
import '../../../../global/extensions/hardcode.dart';
import '../../../../global/gutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _rememberMe = false;

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(kMargin),
          children: [
            Align(
              child: Text(
                'Sign in'.isHardcode,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Gutter(scale: 3),
            FormBuilderTextField(
              name: 'email',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Email address'.isHardcode,
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            const Gutter(),
            FormBuilderTextField(
              name: 'password',
              obscureText: _obscureText,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                labelText: 'Password'.isHardcode,
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                  icon: Icon(_obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const Gutter(),
            Row(
              children: [
                Checkbox(value: _rememberMe, onChanged: (value) => setState(() => _rememberMe = value!)),
                Text('Remember me'.isHardcode),
              ],
            ),
            const Gutter(scale: 3),
            FilledButton(
              // onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(HomePage.routePath, (route) => false),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  String email = _formKey.currentState?.fields['email']?.value as String;
                  String password = _formKey.currentState?.fields['password']?.value as String;

                  if (email == "nguyenminhtam.developer@gmail.com" && password == "tamnguyen") {
                    _saveRememberMe(_rememberMe);

                    Get.offNamed(AppRoutes.home);
                  } else {
                    Get.snackbar(
                      'Error'.isHardcode,
                      'Email or password is incorrect'.isHardcode,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.onUserInteraction;
                  });
                }
              },
              child: Text("Sign in".isHardcode),
            ),
          ],
        ),
      ),
    );
  }

  _saveRememberMe(bool value) async {
    final GetStorage storage = GetStorage();

    await storage.write('rememberMe', value);

    return;
  }
}
