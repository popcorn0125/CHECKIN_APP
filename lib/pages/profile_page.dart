// lib/pages/profile_page.dart
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상단 커스텀 AppBar 사용
      appBar: CustomAppBar(
        onMenuPressed: () {
          // 원래 AppBar에서 menu 아이콘을 눌렀을 때 Navigator.pushNamed(context, '/menu')를 호출했음
          Navigator.pushNamed(context, '/menu');
        },
        onNotificationsPressed: () {
          Navigator.pushNamed(context, '/alarm');
        },
        onProfilePressed: () {
          Navigator.pushNamed(context, '/profile');
        },
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 프로필 이미지 + 플러스 아이콘
            const SizedBox(height: 16),
            _buildProfileSection(),
            const SizedBox(height: 16),

            // 정보 목록
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildInfoRow('이름', '김민수'),
                  const Divider(height: 1),
                  _buildInfoRow('학번', '2021123456'),
                  const Divider(height: 1),
                  _buildInfoRow('학과', '컴퓨터공학과'),
                  const Divider(height: 1),
                  _buildInfoRow('학년', '3학년'),
                  const Divider(height: 1),
                  _buildInfoRow('학교명', '서울대학교'),
                  const Divider(height: 1),
                  _buildInfoRow('휴대폰 번호', '010-1234-5678'),
                  const Divider(height: 1),
                  _buildInfoRow('이메일 주소', 'minsu.kim@email.com'),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // 1) 프로필 영역 (원형 아바타 + 플러스 아이콘)
  Widget _buildProfileSection() {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 원형 아바타
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            // 플러스 아이콘 (오른쪽 하단)
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // TODO: 프로필 이미지 변경 로직
                },
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 2) 정보 행 (예: "이름" - "김민수")
  Widget _buildInfoRow(String label, String value) {
    return ListTile(
      title: Text(label),
      trailing: Text(value),
      onTap: () {
        // TODO: 수정 페이지 이동 등 (필요하다면)
      },
    );
  }
}
