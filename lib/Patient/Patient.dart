import 'package:flutter/material.dart';
import '../doctor/dashboard.dart';
import '../doctor/appointment_management.dart';
import 'abscess.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              width: 375,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildHeader(),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xFFF8F9FB),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 2356),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildTitleSection(),
                                const SizedBox(height: 16),
                                _buildSearchAndActions(),
                                const SizedBox(height: 24),
                                _buildPatientCard(
                                  context: context,
                                  name: 'نسرين صالح أحمد',
                                  age: '32 سنة',
                                  gender: 'أنثى',
                                  idNumber: '4095201335',
                                  isActive: false,
                                ),
                                const SizedBox(height: 16),
                                _buildPatientCard(
                                  context: context,
                                  name: 'نسرين صالح أحمد',
                                  age: '32 سنة',
                                  gender: 'أنثى',
                                  idNumber: '4095201335',
                                  isActive: true,
                                ),
                                const SizedBox(height: 100),
                              ],
                            ),
                          ),
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
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/person.png'),
          backgroundColor: Colors.grey,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'مرحباً',
                  style: TextStyle(color: Color(0xFF868C98), fontSize: 14),
                ),
                SizedBox(width: 4),
                Text('👋', style: TextStyle(fontSize: 16)),
              ],
            ),
            const Text(
              'محمد خالد',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
            ),
          ],
        ),
        const Spacer(),
        _buildHeaderIcon('assets/icon/search-icon.png', Icons.search),
        const SizedBox(width: 12),
        _buildHeaderIcon('assets/icon/nav-icon.png', Icons.notifications_none_outlined),
      ],
    );
  }

  Widget _buildHeaderIcon(String assetPath, IconData fallback) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          width: 50,
          height: 50,
          errorBuilder: (c, e, s) => Icon(fallback, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('المرضى', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        Text('الكل', style: TextStyle(fontSize: 14, color: Color(0xFF7047EB), decoration: TextDecoration.underline)),
      ],
    );
  }

  Widget _buildSearchAndActions() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFF3F4F6)),
            ),
            child: Row(
              children: [
                Image.asset('assets/icon/search.png', width: 20, height: 20, color: Colors.grey),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'ابحث باسم المستخدم، البريد ..',
                      hintStyle: TextStyle(color: Color(0xFF868C98), fontSize: 14),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFF3F4F6)),
          ),
          child: Center(child: Image.asset('assets/icon/filter.png', width: 24, height: 24)),
        ),
        const SizedBox(width: 12),
        Image.asset('assets/icon/printbackground.png', width: 44, height: 44, fit: BoxFit.contain),
      ],
    );
  }

  Widget _buildPatientCard({
    required BuildContext context,
    required String name,
    required String age,
    required String gender,
    required String idNumber,
    required bool isActive,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF22C55E).withOpacity(0.1) : const Color(0xFFEF4444).withOpacity(0.06),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  isActive ? 'نشطة' : 'غير نشطة',
                  style: TextStyle(
                    color: isActive ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: _buildInfoBox('العمر', age, isStart: true)),
                    Expanded(child: _buildInfoBox('الجنس', gender, isStart: false)),
                  ],
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('رقم الهوية', style: TextStyle(color: Color(0xFF868C98), fontSize: 12)),
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(idNumber, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton('تعديل', const Color(0xFF1D4ED8), const Color(0x141D4ED8), const Color(0x331D4ED8), width: 98.33332824707031),
              _buildActionButton('تعطيل', const Color(0xFF92400E), const Color(0x1AFF9500), const Color(0x33FF9500), width: 98.33332824707031),
              _buildActionButton('حذف', const Color(0xFFD80027), const Color(0x14D80027), const Color(0x33D80027), width: 98.33333587646484),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String label, String value, {bool isStart = false}) {
    return SizedBox(
      height: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: isStart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF868C98), fontSize: 11), textAlign: isStart ? TextAlign.right : TextAlign.center),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13), textAlign: isStart ? TextAlign.right : TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, Color textColor, Color bgColor, Color borderColor, {required double width}) {
    return Container(
      width: width,
      height: 36,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 15, offset: const Offset(0, -5))],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, 'لوحة تحكم', 'assets/icon/dashborad_bac.png', false),
            _buildNavItem(context, 'إدارة المواعيد', 'assets/icon/calendar-plus.png', false),
            _buildNavItem(context, 'المرضى', 'assets/icon/users-plus.png', true),
            _buildNavItem(context, 'المختبر', 'assets/icon/cpu.png', false),
            _buildNavItem(context, 'المزيد', 'assets/icon/menu.png', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String label, String iconAsset, bool isActive) {
    final Color activeColor = const Color(0xFF106970);
    final Color itemColor = isActive ? activeColor : const Color(0xFF868C98);

    return Expanded(
      child: InkWell(
        onTap: () {
          if (label == 'لوحة تحكم') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
          } else if (label == 'إدارة المواعيد') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AppointmentManagementScreen()));
          } else if (label == 'المرضى') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PatientListScreen()));
          } else if (label == 'المختبر') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LaboratoryAndLaboratoriesRequestPage()));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconAsset, width: 24, height: 24, color: itemColor,
              errorBuilder: (c, e, s) => Icon(isActive ? Icons.people : Icons.people_outline, color: itemColor),
            ),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 12, color: itemColor, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}