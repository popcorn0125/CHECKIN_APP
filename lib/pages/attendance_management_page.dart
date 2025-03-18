import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceManagementPage extends StatefulWidget {
  const AttendanceManagementPage({Key? key}) : super(key: key);

  @override
  _AttendanceManagementPageState createState() => _AttendanceManagementPageState();
}

class _AttendanceManagementPageState extends State<AttendanceManagementPage> {
  DateTime? _selectedDate;
  bool _isAttendanceBoxVisible = false;
  double _attendanceBoxHeight = -300; // 처음에는 숨김 상태로 시작

  // 날짜 클릭 시 출결현황 박스를 보이게 하거나 숨기는 함수
  void _onDaySelected(DateTime selectedDay) {
    setState(() {
      // 같은 날짜를 두 번 클릭하면 박스를 숨기고, 다른 날짜 클릭 시 박스 표시
      if (_selectedDate == selectedDay) {
        _isAttendanceBoxVisible = !_isAttendanceBoxVisible;
      } else {
        _selectedDate = selectedDay;
        _isAttendanceBoxVisible = true;
      }
      _attendanceBoxHeight = _isAttendanceBoxVisible ? 0 : -300; // 슬라이드 애니메이션을 위한 위치 설정
    });
  }

  // 출결현황 박스를 닫는 함수
  void _closeAttendanceBox() {
    setState(() {
      _attendanceBoxHeight = -300; // 박스를 내리기 위해 위치 조정
      _isAttendanceBoxVisible = false;
    });
  }

  // 터치로 박스를 내릴 때
  void _onTapToClose() {
    setState(() {
      _attendanceBoxHeight = -300; // 박스를 내리기
      _isAttendanceBoxVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          children: [
            // 1) 달력 부분
            _buildCalendar(),
            const SizedBox(height: 16),
            // 2) 선택된 날짜의 출결현황 (애니메이션 효과)
            GestureDetector(
              onTap: _onTapToClose, // 출결박스를 터치하면 닫기
              child: AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                bottom: _attendanceBoxHeight, // 애니메이션을 통한 위치 변화
                left: 0,
                right: 0,
                child: _isAttendanceBoxVisible
                    ? _buildAttendanceDetailBox()
                    : Container(), // 출결박스가 보이지 않으면 빈 컨테이너
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 실제 달력을 표시하는 위젯
  Widget _buildCalendar() {
    return TableCalendar(
      locale: 'ko_KR',
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now(),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, date) {
          return Align(
            alignment: Alignment.center,
            child: Text(
              '${date.year}년 ${date.month}월',
              style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          );
        },
        dowBuilder: (context, day) {
          final koreanWeekdays = ['월', '화', '수', '목', '금', '토', '일'];
          return Center(
            child: Text(
              koreanWeekdays[day.weekday - 1],
              style: GoogleFonts.roboto(
                color: day.weekday == DateTime.saturday || day.weekday == DateTime.sunday
                    ? Colors.red
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
      calendarFormat: CalendarFormat.month,
      daysOfWeekHeight: 30,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue.shade100,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Color(0xFF3374F6),
          shape: BoxShape.circle,
        ),
        defaultTextStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        weekendTextStyle: GoogleFonts.roboto(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      selectedDayPredicate: (day) {
        return _selectedDate != null && day.isSameDate(_selectedDate!);
      },
      onDaySelected: (selectedDay, focusedDay) {
        _onDaySelected(selectedDay);
      },
    );
  }

  // 출결현황 박스
  Widget _buildAttendanceDetailBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3374F6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_selectedDate?.year}년 ${_selectedDate?.month}월 ${_selectedDate?.day}일 출결현황',
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: _closeAttendanceBox,
                child: const Icon(Icons.close, color: Colors.white),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              timeRange,
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            status,
            style: GoogleFonts.roboto(color: statusColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

extension DateTimeComparison on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year && this.month == other.month && this.day == other.day;
  }
}
