import 'package:flutter/material.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/widgets/azan_alert_widget.dart';

class AzanScreen extends StatelessWidget {
  const AzanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SafeArea(
        child: AzanAlertWidget(),
      ),
    );
  }
}
