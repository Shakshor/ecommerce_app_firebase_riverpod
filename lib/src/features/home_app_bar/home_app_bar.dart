import 'package:ecommerce_app_firebase_riverpod/src/features/home_app_bar/shopping_cart_icon.dart';
import 'package:ecommerce_app_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:ecommerce_app_firebase_riverpod/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common_widgets/action_text_button.dart';
import '../../constants/breakpoints.dart';
import '../../models/app_user.dart';
import '../account/account_screen.dart';
import '../orders_list/orders_list_screen.dart';
import '../sign_in/email_password_sign_in_screen.dart';
import '../sign_in/email_password_sign_in_state.dart';
import 'more_menu_button.dart';

/// Custom [AppBar] widget that is reused by the [ProductsListScreen] and
/// [ProductScreen].
/// It shows the following actions, depending on the application state:
/// - [ShoppingCartIcon]
/// - Orders button
/// - Account or Sign-in button
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: get user from auth repository
    const user = AppUser(uid: '123', email: 'test@test.com');
    // * This widget is responsive.
    // * On large screen sizes, it shows all the actions in the app bar.
    // * On small screen sizes, it shows only the shopping cart icon and a
    // * [MoreMenuButton].
    // ! MediaQuery is used on the assumption that the widget takes up the full
    // ! width of the screen. If that's not the case, LayoutBuilder should be
    // ! used instead.
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < Breakpoint.tablet) {
      return AppBar(
        title: Text('My Shop'.hardcoded),
        actions: const [
          ShoppingCartIcon(),
          MoreMenuButton(user: user),
        ],
      );
    } else {
      return AppBar(
        title: Text('My Shop'.hardcoded),
        actions: [
          const ShoppingCartIcon(),
          if (user != null) ...[
            ActionTextButton(
              key: MoreMenuButton.ordersKey,
              text: 'Orders'.hardcoded,
              // onPressed: () => Navigator.of(context).push(
              //   MaterialPageRoute(
              //     fullscreenDialog: true,
              //     builder: (_) => const OrdersListScreen(),
              //   ),
              // ),
              // onPressed: () => context.go('/orders'),
              onPressed: () => context.goNamed(AppRoute.orders.name),
            ),
            ActionTextButton(
              key: MoreMenuButton.accountKey,
              text: 'Account'.hardcoded,
              onPressed: () => context.goNamed(AppRoute.account.name),
            ),
          ] else
            ActionTextButton(
              key: MoreMenuButton.signInKey,
              text: 'Sign In'.hardcoded,
              onPressed: () => context.goNamed(AppRoute.signIn.name),
            )
        ],
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
