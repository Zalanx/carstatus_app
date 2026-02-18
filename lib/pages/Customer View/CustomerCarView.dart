import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomerCarView extends StatelessWidget {
  const CustomerCarView({super.key, required this.ticket});

  final TicketDto ticket;

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      appBar: CsAppbar(pageTitle: "", backButton: true),
      body: _pageBody(context, ticket),
    );
  }
}

Widget _pageBody(BuildContext context, TicketDto ticket) {
  String carStatusText = "";
  if (ticket.carStatus?.value == "Warteschlange"){carStatusText = "ist in der Warteschlange";}
    else if (ticket.carStatus?.value == "InBearbeitung"){carStatusText = "wird gerade bearbeitet";}
    else if (ticket.carStatus?.value == "Abholbereit"){carStatusText = "Dein Auto ist fertig und kann abgeholt werden";}
  return SafeArea(
    child: SingleChildScrollView(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CsText(
              text: "Dein Auto ${ticket.car}",
              size: 32,
              fontWeight: FontWeight.w900,
            ),
            Lottie.asset(
              "assets/carservice.json",
              height: 300,
              width: 300,
            ),
            CsText(
              text: carStatusText,
              size: 32,
              fontWeight: FontWeight.w900,
            ),
            const SizedBox(height: 16),
            CsContainer(
              height: 250,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...ticket.toDos!.map(
            (todo) => Row(
              children: [
                Checkbox(
                  value: todo.done, 
                  onChanged: null, 
                ),
                CsText(text: todo.task ?? "Keine Aufgabe"),
              ],
            ),
          ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    ),
  );
}
