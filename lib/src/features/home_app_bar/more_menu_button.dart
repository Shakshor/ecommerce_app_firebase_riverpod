import 'package:ecommerce_app_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:ecommerce_app_firebase_riverpod/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/app_user.dart';
import '../account/account_screen.dart';
import '../orders_list/orders_list_screen.dart';
import '../sign_in/email_password_sign_in_screen.dart';
import '../sign_in/email_password_sign_in_state.dart';

enum PopupMenuOption {
  signIn,
  orders,
  account,
}

class MoreMenuButton extends StatelessWidget {
  const MoreMenuButton({super.key, this.user});
  final AppUser? user;

  // * Keys for testing using find.byKey()
  static const signInKey = Key('menuSignIn');
  static const ordersKey = Key('menuOrders');
  static const accountKey = Key('menuAccount');

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // three vertical dots icon (to reveal menu options)
      icon: const Icon(Icons.more_vert),
      itemBuilder: (_) {
        // show all the options based on conditional logic
        return user != null
            ? <PopupMenuEntry<PopupMenuOption>>[
                PopupMenuItem(
                  key: ordersKey,
                  value: PopupMenuOption.orders,
                  child: Text('Orders'.hardcoded),
                ),
                PopupMenuItem(
                  key: accountKey,
                  value: PopupMenuOption.account,
                  child: Text('Account'.hardcoded),
                ),
              ]
            : <PopupMenuEntry<PopupMenuOption>>[
                PopupMenuItem(
                  key: signInKey,
                  value: PopupMenuOption.signIn,
                  child: Text('Sign In'.hardcoded),
                ),
              ];
      },
      onSelected: (option) {
        // push to different routes based on selected option
        switch (option) {
          case PopupMenuOption.signIn:
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     fullscreenDialog: true,
            //     builder: (_) => const EmailPasswordSignInScreen(
            //       formType: EmailPasswordSignInFormType.signIn,
            //     ),
            //   ),
            // );
            // context.go('/signIn');
            context.goNamed(AppRoute.signIn.name);
            break;
          case PopupMenuOption.orders:
            context.goNamed(AppRoute.orders.name);
            break;
          case PopupMenuOption.account:
          context.goNamed(AppRoute.account.name);
            break;
        }
      },
    );
  }
}
