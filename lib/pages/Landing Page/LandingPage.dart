import 'package:carstatus_app/components/cs_button.dart';
import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/helper/Themehelper.dart';
import 'package:carstatus_app/pages/Authorization/Login.dart';
import 'package:carstatus_app/pages/Authorization/Registration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeHelper>();
    return CsScaffold(
      resizeToAvoidBottomInset: true,
      body: _pageBody(context), appBar: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [ 
        FaIcon(FontAwesomeIcons.moon, color: theme.darkmode.value ? Colors.yellow : Colors.grey,),
         SizedBox(width: 8,),
        Obx(() => Switch(
            value: theme.darkmode.value,
            onChanged: (x) => theme.toggleTheme(x),
          )),
    ]),);
  }

  Widget _pageBody(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Center(
              child: Text(
                "Samuel Autohaus GmbH",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CsContainer(
                    child: CsButton(
                      onTap: () => Get.to(() => const LoginPage()),
                      height: 120,
                      width: 200,
                      borderRadius: BorderRadius.circular(16),
                      child: CsText(text: "Einloggen",size: 24,),
                    ),
                  ),
                  CsContainer(
                    child: CsButton(
                       onTap: () => Get.to(() => const RegistrationPage()),
                      height: 120,
                      width: 200,
                      borderRadius: BorderRadius.circular(16),
                      child: CsText(text: "Registrieren",size: 24,),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
