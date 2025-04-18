import 'package:ecommerce_app_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/alert_dialogs.dart';
import '../../../common_widgets/primary_button.dart';

/// Button used to initiate the payment flow.
class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  Future<void> _pay(BuildContext context) async {
    // TODO: Implement
    showNotImplementedAlertDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: error handling
    // TODO: loading state
    return PrimaryButton(
      text: 'Pay'.hardcoded,
      isLoading: false,
      onPressed: () => _pay(context),
    );
  }
}
