import 'package:flutter/material.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  String paymentMethod = 'إلكتروني';
  String paymentStatus = 'تم الدفع';

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'اختيار صورة المريض',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Color(0xFF106970)),
                  title: const Text('التقاط صورة'),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Color(0xFF106970)),
                  title: const Text('اختيار من المعرض'),
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

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
                      color: const Color(0xFFF8F9FB),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildProfileImage(),
                            const SizedBox(height: 24),
                            _buildPatientInfoSection(),
                            const SizedBox(height: 24),
                            _buildSectionTitle('معلومات الخدمة'),
                            _buildServiceInfoCard(),
                            const SizedBox(height: 24),
                            _buildSectionTitle('الدفع'),
                            _buildPaymentCard(),
                            const SizedBox(height: 24),
                            _buildSectionTitle('الموعد'),
                            _buildAppointmentCard(),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildActionButtons(),
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
            'اضافة مريض',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('assets/images/woman.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => _showImagePicker(context),
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF106970),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildPatientInfoSection() {
    return _buildCard([
      _buildInputField('الاسم الكامل', 'نص تجريبي', isRequired: true),
      const SizedBox(height: 16),
      _buildInputField('العمر', '32', isRequired: true),
      const SizedBox(height: 16),
      _buildDropdownField('الجنس', 'اختر الجنس', isRequired: true),
      const SizedBox(height: 16),
      _buildLabel('رقم الهاتف للتواصل', isRequired: true),
      const SizedBox(height: 8),
      Row(
        children: [
          Container(
            width: 80,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFD1D1DB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 14, color: Color(0xFF8A8AA3)),
                SizedBox(width: 4),
                Text(
                  '970',
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildInputContainer(
              child: const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '000 000 000',
                  hintStyle: TextStyle(color: Color(0xFF8A8AA3), fontSize: 13),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }

  Widget _buildServiceInfoCard() {
    return _buildCard([
      _buildInputField('إسم الخدمة', 'تنظيف أسنان', isRequired: true),
      const SizedBox(height: 16),
      _buildLabel('سعر الخدمة', isRequired: true),
      const SizedBox(height: 8),
      _buildInputContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.add, color: Color(0xFF106970), size: 20),

            Text('  150 ILS', style: TextStyle(fontSize: 14, color: Color(0xFF6C6C89), fontWeight: FontWeight.normal)),
            Icon(Icons.remove, color: Color(0xFF106970), size: 20),

          ],
        ),
      ),
    ]);
  }

  Widget _buildPaymentCard() {
    return _buildCard([
      _buildRadioSection('طريقة الدفع', ['نقدي', 'إلكتروني'], paymentMethod, (val) {
        setState(() => paymentMethod = val!);
      }),
      const SizedBox(height: 16),
      _buildRadioSection('حالة الدفع', ['لم يتم الدفع', 'تم الدفع'], paymentStatus, (val) {
        setState(() => paymentStatus = val!);
      }),
    ]);
  }

  Widget _buildAppointmentCard() {
    return _buildCard([
      _buildLabel('تاريخ الزيارة', isRequired: true),
      const SizedBox(height: 8),
      _buildInputContainer(
        child: Row(
          children: [
            Image.asset(
              'assets/icon/calendar.png',
              width: 20,
              height: 20,
              errorBuilder: (c, e, s) => const Icon(Icons.calendar_today_outlined, size: 18, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text('dd/mm/yyyy', style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 14)),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      _buildLabel('موعد الزيارة', isRequired: true),
      const SizedBox(height: 8),
      _buildInputContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('09:00 صباحاً', style: TextStyle(fontSize: 13, color: Color(0xFF8A8AA3))),
            const Icon(Icons.keyboard_arrow_down, color: Color(0xFF8A8AA3), size: 20),
          ],
        ),
      ),
    ]);
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
        const SizedBox(height: 8),
        Row(
          children: options.map((opt) => Expanded(
            child: Row(
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
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildButton('اضافة', const Color(0xFF106970), Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildButton('تجاهل', Colors.white, Colors.black, borderColor: const Color(0xFFD1D1DB)),
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
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black)),
          if (isRequired) const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label, isRequired: isRequired),
        const SizedBox(height: 8),
        _buildInputContainer(
          child: TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 13),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String value, {bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label, isRequired: isRequired),
        const SizedBox(height: 8),
        _buildInputContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: const TextStyle(fontSize: 13, color: Color(0xFF8A8AA3))),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF8A8AA3), size: 20),
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

  Widget _buildCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
