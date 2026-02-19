import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/helper/Themehelper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CsAppbar extends StatelessWidget {
  const CsAppbar(
      {super.key,
      this.backButton,
      required this.pageTitle,
      this.backgroundFill,
      this.overrideMiddle,
      this.backButtonOnTap, this.onBackButtonPressed});
  final bool? backButton;
  final void Function()? onBackButtonPressed;
  final String pageTitle;
  final bool? backgroundFill;
  final Widget? overrideMiddle;
  final Function? backButtonOnTap;

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeHelper>();
    return Container(
      color: (backgroundFill ?? false)
          ? Colors.greenAccent
          : Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (backButton ?? false)
                  ? SizedBox(
                      width: 50,
                      child: IconButton(
                        onPressed: () => onBackButtonPressed ?? {
                          Get.back(),
                          backButtonOnTap != null
                              ? backButtonOnTap!()
                              : () => {},
                        },
                        icon: Obx(
                          () => FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color:
                                theme.darkmode.value ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 50,
                    ),
              overrideMiddle ??
                  CsText(
                    text: pageTitle,
                    size: 20,
                    fontWeight: FontWeight.w600,
                  ),
              const SizedBox(
                width: 50,
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
