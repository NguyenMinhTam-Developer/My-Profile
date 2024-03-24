// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:my_profile/app/domain/entities/work_entity.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';
import '../controllers/home_controller.dart';
import '../layouts/default_bottom_sheet_layout.dart';

class WorkEditBottomSheet extends StatefulWidget {
  static show() => Get.bottomSheet(
        const WorkEditBottomSheet._(),
        isScrollControlled: true,
        isDismissible: false,
      );

  const WorkEditBottomSheet._();

  @override
  State<WorkEditBottomSheet> createState() => _WorkEditBottomSheetState();
}

class _WorkEditBottomSheetState extends State<WorkEditBottomSheet> {
  final controller = Get.find<HomePageController>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  List<WorkItemViewModel> workList = [];

  Future<void> _onSave() async {
    bool isFormValid = true;

    for (var skills in workList) {
      if (skills.formKey.currentState?.validate() != true) {
        isFormValid = false;
        setState(() {
          _autovalidateMode = AutovalidateMode.onUserInteraction;
        });
      }
    }

    if (isFormValid) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        works: workList
            .map(
              (e) => WorkEntity(
                title: e.formKey.currentState?.fields["title"]?.value as String,
                description: e.formKey.currentState?.fields["description"]?.value as String,
                appStoreUrl: e.formKey.currentState?.fields["appStoreUrl"]?.value,
                playStoreUrl: e.formKey.currentState?.fields["playStoreUrl"]?.value,
                websiteUrl: e.formKey.currentState?.fields["websiteUrl"]?.value,
                tags: [],
              ),
            )
            .toList(),
      );

      await controller.updateUser();

      Get.back();
    }
  }

  @override
  void initState() {
    super.initState();

    workList = List.generate(
      controller.currentUser.value.works.length,
      (index) {
        var formKey = GlobalKey<FormBuilderState>();
        var initialValue = controller.currentUser.value.works[index];

        return WorkItemViewModel(formKey: formKey, work: initialValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit Testimonial",
      content: ListView.separated(
        itemCount: workList.length + 1,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == workList.length) {
            return TextButton.icon(
              onPressed: () {
                setState(() {
                  workList.add(
                    WorkItemViewModel(
                      formKey: GlobalKey<FormBuilderState>(),
                      work: null,
                    ),
                  );
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add new skills"),
            );
          }

          return FormBuilder(
            key: workList[index].formKey,
            autovalidateMode: _autovalidateMode,
            child: Card(
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.grayLight.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.mobile_friendly_rounded,
                        size: 24,
                      ),
                    ),
                    title: FormBuilderTextField(
                      name: "title",
                      keyboardType: TextInputType.name,
                      initialValue: workList[index].work?.title,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Title",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              workList.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.clear_rounded,
                          ),
                        ),
                      ),
                      style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: FormBuilderTextField(
                      name: "description",
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      initialValue: workList[index].work?.description,
                      minLines: 5,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Description",
                      ),
                      style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.grayLight.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/tech_stack/ic_app_store.svg",
                              height: 24,
                              width: 24,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).iconTheme.color!,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        title: FormBuilderTextField(
                          name: "appStoreUrl",
                          keyboardType: TextInputType.url,
                          initialValue: workList[index].work?.appStoreUrl,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "App Store URL",
                            suffixIcon: IconButton(
                              onPressed: () {
                                workList[index].formKey.currentState?.fields["appStoreUrl"]?.didChange(null);
                              },
                              icon: const Icon(
                                Icons.clear_rounded,
                              ),
                            ),
                          ),
                          style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.grayLight.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/tech_stack/ic_google_play.svg",
                              height: 24,
                              width: 24,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).iconTheme.color!,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        title: FormBuilderTextField(
                          name: "playStoreUrl",
                          keyboardType: TextInputType.url,
                          initialValue: workList[index].work?.playStoreUrl,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Play Store URL",
                            suffixIcon: IconButton(
                              onPressed: () {
                                workList[index].formKey.currentState?.fields["playStoreUrl"]?.didChange(null);
                              },
                              icon: const Icon(
                                Icons.clear_rounded,
                              ),
                            ),
                          ),
                          style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.grayLight.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(Icons.link_rounded),
                          ),
                        ),
                        title: FormBuilderTextField(
                          name: "websiteUrl",
                          keyboardType: TextInputType.url,
                          initialValue: workList[index].work?.websiteUrl,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Website URL",
                            suffixIcon: IconButton(
                              onPressed: () {
                                workList[index].formKey.currentState?.fields["websiteUrl"]?.didChange(null);
                              },
                              icon: const Icon(
                                Icons.clear_rounded,
                              ),
                            ),
                          ),
                          style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      action: FilledButton(
        onPressed: _onSave,
        child: const Text("Save"),
      ),
    );
  }
}

class WorkItemViewModel {
  final GlobalKey<FormBuilderState> formKey;
  final WorkEntity? work;

  WorkItemViewModel({
    required this.formKey,
    required this.work,
  });
}
