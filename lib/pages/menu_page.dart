import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '메뉴',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ────────────── 프로필 영역 ──────────────
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '김민지',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('학번: 20231234'),
                  const SizedBox(height: 2),
                  const Text('전공: 컴퓨터공학과'),
                  const SizedBox(height: 2),
                  const Text('학교: 한국대학교'),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(height: 1),

              // ────────────── 메뉴 항목 리스트 ──────────────
              Expanded(
                child: ListView(
                  children: [
                    _buildMenuItem(Icons.home, '홈', onTap: () {
                       Navigator.pushNamed(context, '/');
                    }),
                    _buildMenuItem(Icons.bar_chart, '출석률 현황', onTap: () {
                      Navigator.pushNamed(context, '/status');
                    }),
                    // 출결 관리 버튼 수정: 클릭하면 '/attendance' 라우트로 이동
                    _buildMenuItem(Icons.edit_calendar, '출결 관리', onTap: () {
                      Navigator.pushNamed(context, '/attendance');
                    }),
                    _buildMenuItem(Icons.notifications, '알림', onTap: () {
                      Navigator.pushNamed(context, '/alarm');
                    }),
                    _buildMenuItem(Icons.campaign, '공지사항', onTap: () {
                      Navigator.pushNamed(context, '/notice');
                    }),
                    _buildMenuItem(Icons.settings, '설정', onTap: () {}),
                  ],
                ),
              ),

              const Divider(),

              // ────────────── 하단 앱버전 & 업데이트 ──────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('앱 버전 1.0.0', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      // TODO: 업데이트 확인 로직
                    },
                    child: const Text('업데이트 확인', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),

              // ────────────── 로그아웃 버튼 ──────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: 로그아웃 처리
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text('로그아웃'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 메뉴 아이템 빌더
  Widget _buildMenuItem(IconData icon, String label, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }
}
