import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/menu_page.dart';
import 'pages/attendance_management_page.dart';
import 'pages/attendance_status_page.dart';
import 'pages/notice_page.dart';
import 'pages/alarm_page.dart'; // 알림 페이지 임포트
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckIn App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(), // 홈화면
        '/menu': (context) => const MenuPage(), // 메뉴화면
        '/attendance': (context) => const AttendanceManagementPage(), // 출결관리화면
        '/status': (context) => const AttendanceStatusPage(), // 출석률현황화면
        '/notice': (context) =>  NoticePage(), // 공지사항화면
        '/alarm': (context) =>  AlarmPage(), // 알림함화면
        '/profile': (context) => const ProfilePage(), // 내정보화면
      },
    );
  }
}
