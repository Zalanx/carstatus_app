import 'package:carstatus_app/components/cs_text.dart';
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
      this.backButtonOnTap});
  final bool? backButton;
  final String pageTitle;
  final bool? backgroundFill;
  final Widget? overrideMiddle;
  final Function? backButtonOnTap;

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => {
                          Get.back(),
                          backButtonOnTap != null
                              ? backButtonOnTap!()
                              : () => {},
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color:
                              (backgroundFill ?? false) ? Colors.white : Colors.black,
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
