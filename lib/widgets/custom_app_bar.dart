import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // systemOverlayStyle 설정용

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onProfilePressed;
  final VoidCallback? onNotificationsPressed;
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    Key? key,
    this.onProfilePressed,
    this.onNotificationsPressed,
    this.onMenuPressed, required String titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      // surfaceTintColor가 투명하면, Material 3의 오버레이 효과가 적용되지 않습니다.
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Text(
          'CHECK IN',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person, color: Colors.grey),
          onPressed: onProfilePressed,
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.grey),
          onPressed: onNotificationsPressed,
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.grey),
          onPressed: onMenuPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
