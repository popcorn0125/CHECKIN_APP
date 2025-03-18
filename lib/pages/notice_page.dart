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
      // 커스텀 AppBar 사용 (이 부분은 필요에 따라 그대로 두되, titleText를 비워두거나 간단하게 처리)
      appBar: CustomAppBar(
        onMenuPressed: () {
          Navigator.pushNamed(context, '/menu');
        },
        onNotificationsPressed: () {
          Navigator.pushNamed(context, '/alarm');
        },
        onProfilePressed: () {
          Navigator.pushNamed(context, '/profile');
        },
        titleText: '', // AppBar에는 제목을 표시하지 않음
      ),
      // 전체 페이지 배경색
      backgroundColor: const Color(0xFFf3f4f6),

      // 본문 구성
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1) 페이지 타이틀
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              '공지사항',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
          ),

          // 2) 공지사항 목록 (ListView)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.separated(
                itemCount: notices.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final notice = notices[index];
                  return _buildNoticeItem(notice);
                },
              ),
            ),
          ),

          // 3) 페이지네이션 영역 (예시)
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPageButton('1', isActive: true),
                const SizedBox(width: 8),
                _buildPageButton('2'),
                const SizedBox(width: 8),
                _buildPageButton('3'),
              ],
            ),
          ),
        ],
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

  // 페이지 번호 버튼 예시
  Widget _buildPageButton(String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isActive ? Colors.blue : Colors.grey.shade300,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
