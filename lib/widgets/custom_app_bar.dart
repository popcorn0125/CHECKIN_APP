import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onProfilePressed;
  final VoidCallback? onNotificationsPressed;
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    Key? key,
    this.onProfilePressed,
    this.onNotificationsPressed,
    this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false, // 왼쪽 정렬
      titleSpacing: 0,
      // leading 부분(로고)은 제거합니다.
      title: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16), // 원하는 만큼 여백 추가
        child: const Text(
          'CHECK IN',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        // 내 정보 아이콘
        IconButton(
          icon: const Icon(Icons.person, color: Colors.grey),
          onPressed: onProfilePressed,
        ),
        // 알림 아이콘
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.grey),
          onPressed: onNotificationsPressed,
        ),
        // 메뉴 아이콘
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
