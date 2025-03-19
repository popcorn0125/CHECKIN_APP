import 'package:flutter/material.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage(
      {super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  State<ProfileUpdatePage> createState() => _profileUpdatePageState();
}

class _profileUpdatePageState extends State<ProfileUpdatePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 16, top: 20, bottom: 9),
                child: Text(
                  '${widget.label}을 입력해주세요', // 여기에서 widget.label 사용
                  style: TextStyle(
                    fontFamily: 'TossProductSans',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '${widget.label}', // 여기에서도 widget.label 사용
                style: const TextStyle(
                  fontFamily: 'TossProductSans',
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: TextField(
                controller: _controller,
                autofocus: true,
                // decoration: const InputDecoration(
                //   hintText: 'Enter ${widget.label}',
                // ),
              ),
            ),
            // SizedBox(
            //   width: double.maxFinite,
            //   height: 50,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // 버튼 클릭 시 입력된 값 출력
            //       print('입력한 ${widget.label}: ${_controller.text}');
            //     },
            //     child: const Text('확인'),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedPadding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        duration: const Duration(milliseconds: 0),
        curve: Curves.easeOut,
        child: SizedBox(
          width: double.infinity,
          height: 65,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.blue, // 파란색 배경
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // 둥근 모서리 제거
              ),
            ),
            onPressed: () {
              print('입력한 ${widget.label}: ${_controller.text}');
            },
            child: const Text(
              '확인',
              style: TextStyle(
                fontFamily: 'TossProductSans',
                fontSize: 16,
                color: Colors.white, // 흰색 글자
              ),
            ),
          ),
        ),
      ),
    );
  }
}
