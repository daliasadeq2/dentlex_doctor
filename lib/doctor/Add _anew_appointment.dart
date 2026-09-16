import 'package:flutter/material.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  String paymentMethod = 'بطاقة';
  String paymentStatus = 'تم الدفع';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
                      color: Colors.white, // تم تغييره للون الأبيض ليتطابق مع طلبك
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'إضافة موعد جديد',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            const SizedBox(height: 16),
                            _buildFormCard(),
                            const SizedBox(height: 32),
                            _buildActionButtons(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
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
            'اضافة موعد',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 24), // Spacer for balance
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // تم إزالة boxShadow لإزالة أي ظل رمادي غير مرغوب فيه
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDropdownField('المريض', 'اختر للمريض', isRequired: true),
          const SizedBox(height: 16),
          _buildDropdownField('الغرفة', 'اختر الغرفة', isRequired: true),
          const SizedBox(height: 16),
          _buildDropdownField('الخدمات', 'اضافة خدمة', isRequired: true),
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text('اختر خدمة واحدة أو أكثر', style: TextStyle(color: Colors.grey, fontSize: 11)),
          ),
          const SizedBox(height: 16),
          _buildLabel('تاريخ الموعد', isRequired: true),
          const SizedBox(height: 8),
          _buildInputContainer(
            child: Row(
              children: [
                const Expanded(
                  child: Text('dd/mm/yyyy', style: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
                const SizedBox(width: 12),
                Transform.scale(
                  scale: 1.1,
                  child: Image.asset(
                    'assets/icon/datte.png',
                    width: 24,
                    height: 24,
                    errorBuilder: (c, e, s) => const Icon(
                      Icons.calendar_today_outlined,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildRadioSection('طريقة الدفع', ['نقدي', 'تحويل بنكي', 'بطاقة'], paymentMethod, (val) {
            setState(() => paymentMethod = val!);
          }),
          const SizedBox(height: 24),
          _buildRadioSection('حالة الدفع', ['قيد الانتظار', 'تم الدفع', 'دفع جزئي'], paymentStatus, (val) {
            setState(() => paymentStatus = val!);
          }),
          const SizedBox(height: 24),
          _buildLabel('ملاحظات (اختياري)'),
          const SizedBox(height: 8),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFD1D1DB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'نص تجريبي',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioSection(String title, List<String> options, String groupValue, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildLabel(title, isRequired: true),
            const SizedBox(width: 4),
            Image.asset(
              'assets/icon/Tooltip Trigger.png',
              width: 16,
              height: 16,
              errorBuilder: (c, e, s) => const Icon(Icons.info_outline, size: 14, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: options.map((opt) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<String>(
                value: opt,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: const Color(0xFF106970),
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              ),
              const SizedBox(width: 4),
              Text(opt, style: const TextStyle(fontSize: 13)),
            ],
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton('اضافة', const Color(0xFF106970), Colors.white),
        _buildButton('تجاهل', Colors.white, Colors.black, borderColor: const Color(0xFFD1D1DB)),
      ],
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
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black)),
          if (isRequired) const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String hint, {bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label, isRequired: isRequired),
        const SizedBox(height: 8),
        _buildInputContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(hint, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputContainer({required Widget child}) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD1D1DB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
