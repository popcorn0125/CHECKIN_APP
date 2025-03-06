// lib/pages/alarm_page.dart
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

// 간단한 알림 데이터 모델
class AlarmItem {
  final String title; // 알림 제목
  final String time;  // 예: "방금 전", "2시간 전", "어제", 날짜 등

  AlarmItem(this.title, this.time);
}

class AlarmPage extends StatelessWidget {
  AlarmPage({Key? key}) : super(key: key);

  // 예시 알림 데이터
  final List<AlarmItem> alarms = [
    AlarmItem('3월 신학기 출석체크 시스템 업데이트 안내', '방금 전'),
    AlarmItem('2024학년도 1학기 시간표 변경 안내', '2시간 전'),
    AlarmItem('도서관 운영시간 변경 안내', '어제'),
    AlarmItem('통계학과 방학 수학일정 안내', '2024.01.15'),
    AlarmItem('2024년도 1학기 장학금 신청 안내', '2024.01.13'),
    AlarmItem('겨울방학 기간 도서관 이용 안내', '2024.01.13'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onMenuPressed: () {
          // 원래 AppBar에서 menu 아이콘을 눌렀을 때 Navigator.pushNamed(context, '/menu')를 호출했음
          Navigator.pushNamed(context, '/menu');
        },
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 "최근 알림" + "전체 없음" 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '최근 알림',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: "전체 없음" 로직 (ex: 모든 알림을 지우거나 읽음 처리)
                  },
                  child: const Text(
                    '전체 없음',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 알림 목록
            Expanded(
              child: ListView.separated(
                itemCount: alarms.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final alarm = alarms[index];
                  return _buildAlarmItem(alarm);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 알림 아이템
  Widget _buildAlarmItem(AlarmItem alarm) {
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
          // 알림 제목
          Text(
            alarm.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          // 시간
          Text(
            alarm.time,
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
