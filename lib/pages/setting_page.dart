// lib/pages/settings_page.dart
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f4f6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 설정 항목 목록
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                child: Column(
                  children: [
                    _buildMenuItemWithoutIcon( '알림 설정', onTap: () {
                      // 알림 설정 페이지로 이동 (추가 가능)
                    }),
                    _buildMenuItemWithoutIcon( '언어 설정', onTap: () {
                      // 언어 설정 페이지로 이동 (추가 가능)
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                child: Column(
                  children: [
                    _buildMenuItemWithoutIcon('약관 및 개인정보 처리 동의', onTap: () {
                      // 추가 기능 처리
                    }),
                    _buildMenuItemWithoutIcon('개인정보 처리방침', onTap: () {
                      // 개인정보 처리방침 페이지로 이동
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                child: Column(
                  children: [
                    _buildMenuItemWithoutArrow('앱 정보', '앱 버전 1.0', onTap: () {
                      // 앱 정보 페이지로 이동 (추가 가능)
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 화살표 없는 메뉴 항목 (아이콘 없이 텍스트만 추가)
  Widget _buildMenuItemWithoutArrow(String label, String versionText, {VoidCallback? onTap}) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 15)),
          Text(versionText, style: const TextStyle(fontSize: 15, color: Colors.black45)),
        ],
      ),
      onTap: onTap,
    );
  }

  // 아이콘 없는 메뉴 항목 생성 메서드
  Widget _buildMenuItemWithoutIcon(String label, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,
          size: 15, color: Color(0xFF9CA3AF)),
      onTap: onTap,
    );
  }

  // 아이콘 있는 메뉴 항목 생성 메서드
  Widget _buildMenuItem(IconData icon, String label, {VoidCallback? onTap}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(label, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,
          size: 15, color: Color(0xFF9CA3AF)),
      onTap: onTap,
    );
  }
}
