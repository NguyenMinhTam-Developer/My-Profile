// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        enableDrag: false,
      );

  const WorkEditBottomSheet._();

  @override
  State<WorkEditBottomSheet> createState() => _WorkEditBottomSheetState();
}

class _WorkEditBottomSheetState extends State<WorkEditBottomSheet> {
  final controller = Get.find<HomePageController>();

  List<WorkItemViewModel> workList = [];
  @override
  void initState() {
    super.initState();

    workList = List.generate(
      controller.currentUser.value.works.length,
      (index) {
        var initialValue = controller.currentUser.value.works[index];

        return WorkItemViewModel(initialValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetLayout(
      title: "Edit Works",
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
                  workList.add(WorkItemViewModel(null));
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add new skills"),
            );
          }

          return Card(
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
                    controller: workList[index].title,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Title",
                      errorText: workList[index].titleErrorText,
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
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: FormBuilderTextField(
                    name: "description",
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: workList[index].description,
                    minLines: 5,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Description",
                      errorText: workList[index].descriptionErrorText,
                    ),
                    style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade800),
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
                        controller: workList[index].appStoreUrl,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "App Store URL",
                          suffixIcon: IconButton(
                            onPressed: () {
                              workList[index].appStoreUrl.text = "";
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
                        controller: workList[index].playStoreUrl,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Play Store URL",
                          suffixIcon: IconButton(
                            onPressed: () {
                              workList[index].playStoreUrl.text = "";
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
                        controller: workList[index].websiteUrl,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Website URL",
                          suffixIcon: IconButton(
                            onPressed: () {
                              workList[index].websiteUrl.text = "";
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
          );
        },
      ),
      action: FilledButton(
        onPressed: _onSave,
        child: const Text("Save"),
      ),
    );
  }

  Future<void> _onSave() async {
    bool isFormValid = true;

    for (var work in workList) {
      if (work.title.text.isEmpty) {
        setState(() {
          work.titleErrorText = "This field is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          work.titleErrorText = null;
        });
      }

      if (work.description.text.isEmpty) {
        setState(() {
          work.descriptionErrorText = "This field is required";
        });

        isFormValid = false;
      } else {
        setState(() {
          work.descriptionErrorText = null;
        });
      }
    }

    if (isFormValid) {
      controller.currentUser.value = controller.currentUser.value.copyWith(
        works: workList
            .map(
              (e) => WorkEntity(
                title: e.title.text,
                description: e.description.text,
                appStoreUrl: e.appStoreUrl.text,
                playStoreUrl: e.playStoreUrl.text,
                websiteUrl: e.websiteUrl.text,
                tags: [],
              ),
            )
            .toList(),
      );

      Get.back();

      await controller.updateUser();
    }
  }
}

class WorkItemViewModel {
  late final TextEditingController title;
  late final TextEditingController description;
  late final TextEditingController appStoreUrl;
  late final TextEditingController playStoreUrl;
  late final TextEditingController websiteUrl;

  String? titleErrorText;
  String? descriptionErrorText;

  WorkItemViewModel(WorkEntity? work) {
    title = TextEditingController(text: work?.title);
    description = TextEditingController(text: work?.description);
    appStoreUrl = TextEditingController(text: work?.appStoreUrl);
    playStoreUrl = TextEditingController(text: work?.playStoreUrl);
    websiteUrl = TextEditingController(text: work?.websiteUrl);
  }
}
