import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key});
    
  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    // React의 useEffect와 같이 초기화 작업 수행
  }

  @override
  void dispose() {
    // 필요시 정리 작업 수행
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 기본 앱바나 배경색 등은 필요에 따라 수정
      appBar: AppBar(
        title: const Text("Attendance Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 인사말 섹션
              const Text(
                '홍길동님, 반가워요!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // 출석률 현황 섹션
              const Text(
                '출석률 현황',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // 오늘의 출석률
                  Column(
                    children: [
                      Text('오늘의 출석률'),
                      SizedBox(height: 5),
                      Text(
                        '40%',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // 전체 출석률
                  Column(
                    children: [
                      Text('전체 출석률'),
                      SizedBox(height: 5),
                      Text(
                        '80%',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // 공지사항 섹션
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '공지사항',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // "더보기" 버튼 동작 구현
                    },
                    child: const Text(
                      '더보기 +',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // 공지사항 목록
              Column(
                children: const [
                  NoticeItem(
                    title: '2024년도 1학기 출석체크 시스템 변경..',
                    date: '2024.01.15',
                  ),
                  NoticeItem(
                    title: '겨울방학 기간 출석체크 운영 안내',
                    date: '2024.01.10',
                  ),
                  NoticeItem(
                    title: '모바일 웹 업데이트 안내 (v2.1.0)',
                    date: '2024.01.05',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // 현재 날짜/시간 및 출석 버튼 섹션
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '오늘은 1월 24일 금요일이에요 :)',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '07:09:27',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 출석 버튼 동작 구현
                    },
                    child: const Text('출석'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // 출결관리 섹션
              const Text(
                '출결관리',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // 시간별 출결 관리 리스트
              Column(
                children: const [
                  AttendanceTimeSlot(time: '09:00'),
                  AttendanceTimeSlot(time: '10:00'),
                  AttendanceTimeSlot(time: '11:00'),
                  AttendanceTimeSlot(time: '12:00'),
                  AttendanceTimeSlot(time: '13:00'),
                  AttendanceTimeSlot(time: '14:00'),
                  AttendanceTimeSlot(time: '15:00'),
                  AttendanceTimeSlot(time: '16:00'),
                  AttendanceTimeSlot(time: '17:00'),
                  AttendanceTimeSlot(time: '18:00'),
                ],
              ),
              const SizedBox(height: 10),
              // 출결 상태 범례
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  LegendItem(color: Colors.green, label: '출석'),
                  LegendItem(color: Colors.red, label: '결석'),
                  LegendItem(color: Colors.orange, label: '지각'),
                ],
              ),
              const SizedBox(height: 20),
              // 하단 체크인 섹션
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Check IN',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Icon(Icons.check, color: Colors.white, size: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 공지사항 아이템 위젯
class NoticeItem extends StatelessWidget {
  final String title;
  final String date;

  const NoticeItem({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            date,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// 시간별 출결 관리 아이템 위젯
class AttendanceTimeSlot extends StatelessWidget {
  final String time;

  const AttendanceTimeSlot({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    // 필요에 따라 추가 UI(예: 출석/결석/지각 상태 표시)를 구현할 수 있음
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            time,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          // 추가 표시를 원한다면 여기에 아이콘이나 색상 변경 등 구현 가능
        ],
      ),
    );
  }
}

// 출결 상태 범례 아이템 위젯
class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
