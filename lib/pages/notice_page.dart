// lib/pages/notice_page.dart
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

// 간단한 공지사항 데이터 모델
class Notice {
  final String title; // 공지 제목
  final String time;  // 게시 시간 (예: "방금 전", "2시간 전", "어제", "2024.01.13" 등)

  Notice(this.title, this.time);
}

class NoticePage extends StatelessWidget {
  NoticePage({Key? key}) : super(key: key);

  // 예시 공지사항 데이터
  final List<Notice> notices = [
    Notice('3월 신학기 출석체크 시스템 업데이트 안내', '방금 전'),
    Notice('2024학년도 1학기 시간표 변경 안내', '2시간 전'),
    Notice('도서관 운영시간 변경 안내', '어제'),
    Notice('통계학과 방학 수학일정 안내', '2024.01.15'),
    Notice('2024년도 1학기 장학금 신청 안내', '2024.01.13'),
    Notice('겨울방학 기간 도서관 이용 안내', '2024.01.13'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 커스텀 AppBar 사용
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // 공지사항 목록
        child: ListView.separated(
          itemCount: notices.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final notice = notices[index];
            return _buildNoticeItem(notice);
          },
        ),
      ),
    );
  }

  // 공지사항 아이템 UI
  Widget _buildNoticeItem(Notice notice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 공지 제목
          Text(
            notice.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          // 작성 시간
          Text(
            notice.time,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
