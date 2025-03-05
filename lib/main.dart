import 'package:flutter/material.dart';

void main() {
  runApp(const CheckInApp());
}

class CheckInApp extends StatelessWidget {
  const CheckInApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check In',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9FAFB), // 배경색
      ),
      home: const CheckInScreen(),
    );
  }
}

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyCustomDrawer(), // ← 커스텀 드로어 추가
      // 디자인 상단에 맞춰 AppBar 대신 직접 구현하거나, 아래처럼 AppBar 사용 가능
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          alignment: Alignment.center,
          child: Container(
            width: 28,
            height: 28,
            color: Colors.blue, // "T" 부분 (예: 사각형 배경)
            child: const Center(
              child: Text(
                'T',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: const Text(
          'CHECK IN',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.grey),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // ← Builder로 감싸서 해결!
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1) 인사말
            const Text(
              '홍길동님, 반가워요!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // 2) 출석률 현황
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '출석률 현황',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 오늘의 출석률
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('오늘의 출석률'),
                        Text('40%'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.4, // 40%
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 전체 출석률
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('전체 출석률'),
                        Text('80%'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.8, // 80%
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 3) 날짜/시간 + 출석 버튼
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '오늘은 1월 24일 금요일이에요 :)',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '07:09:27',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('출석'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 4) 출결관리
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '출결관리',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 시간별 아이템 (예시)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildAttendanceCircle('09:00', Colors.green),
                        _buildAttendanceCircle('10:00', Colors.green),
                        _buildAttendanceCircle('11:00', Colors.green),
                        _buildAttendanceCircle('12:00', Colors.red),
                        _buildAttendanceCircle('13:00', Colors.red),
                        _buildAttendanceCircle('14:00', Colors.green),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // 범례
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildLegend(Colors.green, '출석'),
                        _buildLegend(Colors.red, '결석'),
                        _buildLegend(Colors.orange, '지각'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 5) 공지사항
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 상단 바
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '공지사항',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('더보기 +'),
                        ),
                      ],
                    ),
                    const Divider(),
                    // 공지사항 리스트
                    const _NoticeItem(
                      title: '2024년도 1학기 출석체크 시스템 변경..',
                      date: '2024.01.15',
                    ),
                    const Divider(),
                    const _NoticeItem(
                      title: '겨울방학 기간 출석체크 운영 안내',
                      date: '2024.01.10',
                    ),
                    const Divider(),
                    const _NoticeItem(
                      title: '모바일 웹 업데이트 안내 (v2.1.0)',
                      date: '2024.01.05',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 출결관리에서 시간 + 동그라미를 표현하는 위젯
  Widget _buildAttendanceCircle(String time, Color color) {
    return Column(
      children: [
        Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
      ],
    );
  }

  // 출결관리 범례
  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}

// 공지사항 아이템
class _NoticeItem extends StatelessWidget {
  final String title;
  final String date;

  const _NoticeItem({Key? key, required this.title, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class MyCustomDrawer extends StatelessWidget {
  const MyCustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Drawer 최상단 SafeArea로 감싸서 노치/상단바 침범 방지
      child: SafeArea(
        child: Column(
          children: [
            // ────────────── 상단 프로필 영역 ──────────────
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // 원형 아바타
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey,
                    // 실제 이미지가 있다면 backgroundImage: NetworkImage(...) 사용
                    child: Icon(Icons.person, size: 32, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  // 사용자 정보
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '김민지',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('학번: 20231234'),
                        Text('전공: 컴퓨터공학과'),
                        Text('학교: 한국대학교'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // ────────────── 메뉴 항목들 ──────────────
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('홈'),
                    onTap: () {
                      // TODO: 홈 화면 이동
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bar_chart),
                    title: const Text('출석률 현황'),
                    onTap: () {
                      // TODO: 출석률 화면 이동
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.checklist_rtl),
                    title: const Text('출결 관리'),
                    onTap: () {
                      // TODO: 출결관리 화면 이동
                    },
                  ),
                  // 알림 (오른쪽에 알림 갯수 '2' 표시)
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('알림'),
                    trailing: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '2',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    onTap: () {
                      // TODO: 알림 화면 이동
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.campaign),
                    title: const Text('공지사항'),
                    onTap: () {
                      // TODO: 공지사항 화면 이동
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('설정'),
                    onTap: () {
                      // TODO: 설정 화면 이동
                    },
                  ),
                ],
              ),
            ),

            // ────────────── 하단 앱버전 & 로그아웃 ──────────────
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  // 앱 버전 + 업데이트 확인
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '앱 버전 1.0.0',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: 업데이트 확인 로직
                        },
                        child: const Text(
                          '업데이트 확인',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  // 로그아웃 버튼
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: 로그아웃 처리
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black87,
                      ),
                      child: const Text('로그아웃'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
