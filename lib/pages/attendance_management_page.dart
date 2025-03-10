import 'package:flutter/material.dart';
// CustomAppBar가 있는 파일을 import
import '../widgets/custom_app_bar.dart';

class AttendanceManagementPage extends StatelessWidget {
  const AttendanceManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 기존 AppBar 대신 CustomAppBar 사용
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
        }, titleText: '',
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 1) 달력 부분 (2월 달력)
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // "2024년 2월" 제목
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '2024년 2월',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // 요일 헤더 (일 ~ 토)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('일', style: TextStyle(color: Colors.red)),
                        Text('월'),
                        Text('화'),
                        Text('수'),
                        Text('목'),
                        Text('금'),
                        Text('토', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // 달력 날짜 (단순 예시 - 실제 로직은 table_calendar 등 사용 권장)
                    _buildCalendarGrid(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2) 선택된 날짜(2월 5일) 출결 현황 (파란색 박스)
            _buildAttendanceDetailBox(),
          ],
        ),
      ),
    );
  }

  // 달력 Grid (정적인 예시)
  Widget _buildCalendarGrid() {
    final days = [
      ['29', '30', '31', '1',  '2',  '3',  '4'],
      ['5',  '6',  '7',  '8',  '9',  '10', '11'],
      ['12', '13', '14', '15', '16', '17', '18'],
      ['19', '20', '21', '22', '23', '24', '25'],
      ['26', '27', '28', '',   '',   '',   ''],
    ];

    return Column(
      children: days.map((week) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: week.map((day) {
            final isSelected = (day == '5');
            return Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade100 : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  day,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  // 파란색 박스 (2024년 2월 5일 출결현황 + 시간별 리스트)
  Widget _buildAttendanceDetailBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue, // 파란 배경
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // 상단 바 (타이틀 + X 버튼)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '2024년 2월 5일 출결현황',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  // TODO: 닫기 로직
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 시간별 리스트
          Column(
            children: [
              _buildTimeSlot('09:00 ~ 10:00', '결석', Colors.red),
              const SizedBox(height: 8),
              _buildTimeSlot('10:00 ~ 11:00', '지각', Colors.orange),
              const SizedBox(height: 8),
              _buildTimeSlot('11:00 ~ 12:00', '출석', Colors.green),
              const SizedBox(height: 8),
              _buildTimeSlot('13:00 ~ 14:00', '출석', Colors.green),
              const SizedBox(height: 8),
              _buildTimeSlot('14:00 ~ 15:00', '출석', Colors.green),
              const SizedBox(height: 8),
              _buildTimeSlot('15:00 ~ 16:00', '출석', Colors.green),
              const SizedBox(height: 8),
              _buildTimeSlot('16:00 ~ 17:00', '출석', Colors.green),
              const SizedBox(height: 8),
              _buildTimeSlot('17:00 ~ 18:00', '결석', Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  // 시간 슬롯 하나 (흰색 카드 + "결석/지각/출석" 색상)
  Widget _buildTimeSlot(String timeRange, String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white, // 흰색 배경
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              timeRange,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
