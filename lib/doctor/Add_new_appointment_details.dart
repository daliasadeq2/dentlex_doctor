import 'package:flutter/material.dart';

class AddAppointmentDetailsScreen extends StatefulWidget {
  const AddAppointmentDetailsScreen({super.key});

  @override
  State<AddAppointmentDetailsScreen> createState() => _AddAppointmentDetailsScreenState();
}

class _AddAppointmentDetailsScreenState extends State<AddAppointmentDetailsScreen> {
  String paymentMethod = 'نقدي';
  String paymentStatus = 'لم يتم الدفع';

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
                            _buildSectionTitle('معلومات المريض'),
                            _buildPatientInfoCard(),
                            const SizedBox(height: 24),
                            _buildSectionTitle('معلومات الخدمة'),
                            _buildServiceInfoCard(),
                            const SizedBox(height: 24),
                            _buildSectionTitle('الدفع'),
                            _buildPaymentCard(),
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
          const Spacer(),
          const Text(
            'اضافة موعد',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const SizedBox(width: 24), 
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4B4B4B)),
      ),
    );
  }

  Widget _buildPatientInfoCard() {
    return _buildCard([
      _buildInputField('إسم المريض', 'محمد حلمي', isRequired: true),
      const SizedBox(height: 16),
      _buildInputField('رقم الغرفة', 'غرفة 2', isRequired: true),
      const SizedBox(height: 16),
      _buildLabel('رقم الهاتف للتواصل', isRequired: true),
      const SizedBox(height: 8),
      Row(
        children: [
          Container(
            width: 100,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFD1D1DB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add, size: 16, color: Color(0xFF8A8AA3)),
                SizedBox(width: 10),
                Text(
                  '970', 
                  style: TextStyle(fontSize: 14, color: Colors.black)
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildInputContainer(
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: '000 000 000',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
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
             Text('150 ILS', style: TextStyle(fontSize: 14, color: Colors.grey)),
             Icon(Icons.remove, color: Color(0xFF106970), size: 20),
          ],
        ),
      ),
      const SizedBox(height: 16),
      _buildDropdownField('مدة الخدمة', '45 دقيقة', isRequired: true),
      const SizedBox(height: 16),
      _buildLabel('تاريخ الزيارة', isRequired: true),
      const SizedBox(height: 8),
      _buildInputContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('dd/mm/yyyy', style: TextStyle(color: Colors.grey, fontSize: 14)),
            Image.asset(
              'assets/icon/date.png',
              width: 18,
              height: 18,
              errorBuilder: (c, e, s) => const Icon(Icons.calendar_today_outlined, size: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      _buildDropdownField('موعد الزيارة', '09:00 صباحاً', isRequired: true),
    ]);
  }

  Widget _buildSchedulingCard() {
    return _buildCard([
      _buildLabel('تاريخ الزيارة', isRequired: true),
      const SizedBox(height: 8),
      _buildInputContainer(
        child: Row(
          children: [
            Image.asset(
              'assets/icon/date.png',
              width: 18,
              height: 18,
              errorBuilder: (c, e, s) => const Icon(Icons.calendar_today_outlined, size: 18, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            const Text('dd/mm/yyyy', style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      ),
      const SizedBox(height: 16),
      _buildDropdownField('موعد الزيارة', '09:00 صباحاً', isRequired: true),
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

  Widget _buildRadioSection(String title, List<String> options, String groupValue, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildLabel(title, isRequired: true),
            const SizedBox(width: 8),
            Image.asset(
              'assets/icon/Subtract.png',
              width: 14,
              height: 14,
              errorBuilder: (c, e, s) => const SizedBox(),
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
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return const Color(0xFF106970);
                    }
                    return const Color(0xFFD1D1DB);
                  }),
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                ),
                const SizedBox(width: 8),
                Text(opt, style: const TextStyle(fontSize: 13)),
              ],
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD1D1DB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'تجاهل',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF106970),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'اضافة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
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
              Text(value, style: const TextStyle(fontSize: 13, color: Colors.grey)),
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
