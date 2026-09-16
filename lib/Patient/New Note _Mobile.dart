import 'package:flutter/material.dart';

class NewNoteMobileScreen extends StatefulWidget {
  const NewNoteMobileScreen({super.key});

  @override
  State<NewNoteMobileScreen> createState() => _NewNoteMobileScreenState();
}

class _NewNoteMobileScreenState extends State<NewNoteMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 375,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  _buildHeader(context),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF8F9FB),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 2356),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFormCard(),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _buildBottomActions(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              'assets/icon/back.png',
              width: 24,
              height: 24,
              errorBuilder: (c, e, s) => const Icon(Icons.arrow_forward, color: Colors.grey),
            ),
          ),
          const Text(
            'ملاحظة جديدة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('رقم الجوال'),
          _buildDisabledTextField('0594231200'),
          const SizedBox(height: 4),
          const Text(
            'يُؤخذ من بروفايل المريض — لا يمكن تعديله هنا',
            style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 11),
          ),
          const SizedBox(height: 24),
          _buildLabel('الرسالة'),
          _buildMultilineTextField('نص الرسالة'),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildDisabledTextField(String value) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD1D1DB)),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          value,
          style: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildMultilineTextField(String hint) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD1D1DB)),
      ),
      child: TextField(
        maxLines: null,
        textAlign: TextAlign.right,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 13),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton('حفظ', const Color(0xFF106970), Colors.white),
          _buildButton('الغاء', Colors.white, Colors.black, borderColor: const Color(0xFFD1D1DB)),
        ],
      ),
    );
  }

  Widget _buildButton(String label, Color bgColor, Color textColor, {Color? borderColor}) {
    return Container(
      width: 167.5,
      height: 44,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
