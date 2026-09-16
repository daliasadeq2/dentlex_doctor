import 'package:flutter/material.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({super.key});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
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
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFormCard(),
                          ],
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
            'اضافة تذكير',
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
          _buildLabel('العنوان'),
          _buildTextField('العنوان'),
          const SizedBox(height: 16),
          _buildLabel('النوع'),
          _buildDropdownField('النوع'),
          const SizedBox(height: 16),
          _buildLabel('الوصف'),
          _buildMultilineTextField('نص تجريبي'),
          const SizedBox(height: 16),
          _buildLabel('تاريخ التذكير', isRequired: true),
          _buildIconTextField('dd/mm/yyyy', 'assets/icon/datte.png'),
          const SizedBox(height: 16),
          _buildLabel('الوقت', isRequired: true),
          _buildIconTextField('8:00', 'assets/icon/clock.png'),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          if (isRequired)
            const Text(' *', style: TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD1D1DB)),
      ),
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 13),
          border: InputBorder.none,
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
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 13),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String value) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD1D1DB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 13)),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xFF8A8AA3)),
        ],
      ),
    );
  }

  Widget _buildIconTextField(String hint, String iconAsset) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD1D1DB)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              hint,
              style: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 13),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 12),
          Image.asset(
            iconAsset,
            width: 24,
            height: 24,
            errorBuilder: (c, e, s) => const Icon(Icons.event, size: 24, color: Color(0xFF8A8AA3)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildButton('حفظ', const Color(0xFF106970), Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildButton('الغاء', Colors.white, Colors.black, borderColor: const Color(0xFFD1D1DB)),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, Color bgColor, Color textColor, {Color? borderColor}) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
