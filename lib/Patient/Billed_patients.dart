import 'package:flutter/material.dart';
import 'Patient_Profile.dart';
import '../doctor/appointment_management.dart';
import 'clinical_examination.dart';
import '../doctor/dashboard.dart';
import 'Patient.dart';
import 'Dental_pulp_cases.dart';
import 'abscess.dart';
import 'missing teeth.dart';
import 'impacted teeth.dart';
import 'rays.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';

class BilledPatientsScreen extends StatefulWidget {
  const BilledPatientsScreen({super.key});

  @override
  State<BilledPatientsScreen> createState() => _BilledPatientsScreenState();
}

class _BilledPatientsScreenState extends State<BilledPatientsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'محمد علي',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildTabBar(context),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _buildSearchAndTools(),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xFFF8F9FB),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            _buildInvoiceCard(status: 'مدفوع', statusColor: const Color(0xFF10B981)),
                            const SizedBox(height: 16),
                            _buildInvoiceCard(status: 'غير مدفوع', statusColor: const Color(0xFFEF4444)),
                            const SizedBox(height: 40),
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
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'المرضى',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/icon/back.png',
                width: 24,
                height: 24,
                errorBuilder: (c, e, s) => const Icon(Icons.arrow_forward, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: const Color(0xFF106970),
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16),
      tabAlignment: TabAlignment.start,
      padding: EdgeInsets.zero,
      labelColor: const Color(0xFF106970),
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PatientProfileScreen()));
        } else if (index == 1) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ClinicalExaminationScreen()));
        } else if (index == 2) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DentalPulpCasesScreen()));
        } else if (index == 3) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RaysScreen()));
        }
      },
      tabs: const [
        Tab(text: 'الملف الشخصي'),
        Tab(text: 'فحص سريري'),
        Tab(text: 'المخطط السني'),
        Tab(text: 'صور اشعة'),
        Tab(text: 'فواتير'),
      ],
    );
  }

  Widget _buildSearchAndTools() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon/search.png',
                  width: 20,
                  height: 20,
                  color: Colors.grey,
                  errorBuilder: (c, e, s) => const Icon(Icons.search, color: Colors.grey, size: 20),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'ابحث باسم المستخدم، البريد ..',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Center(
            child: Image.asset(
              'assets/icon/filter.png',
              width: 20,
              height: 20,
              errorBuilder: (c, e, s) => const Icon(Icons.tune, color: Colors.grey, size: 20),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Image.asset(
          'assets/icon/printbackground.png',
          width: 56,
          height: 44,
          fit: BoxFit.contain,
          errorBuilder: (c, e, s) => Container(
            width: 56,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF106970),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.print, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }

  Widget _buildInvoiceCard({required String status, required Color statusColor}) {
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
            children: const [
              Text(
                'رقم: #001',
                style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12),
              ),
              Text(
                '15 ديسمبر 2025، 11:32 ص',
                style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'اسم المريض: نسرين صالح',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 4),
          const Text(
            'الطبيب: د. أحمد منصور',
            style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 13),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFC2FAEF),
                borderRadius: BorderRadius.circular(42),
              ),
              child: const Text(
                'الخدمة: حشوة اسنان',
                style: TextStyle(color: Color(0xFF106970), fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('المبلغ الاجمالي', style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12)),
                    const SizedBox(height: 8),
                    const Text('90ش', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text('الحالة', style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12)),
                      const SizedBox(height: 8),
                      Text(
                        status,
                        style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40), // توازن المساحة مع "المبلغ الاجمالي" في اليمين
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
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
    final Color itemColor = isActive ? activeColor : Colors.grey;

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
            Image.asset(
              iconAsset,
              width: 24,
              height: 24,
              color: itemColor,
              errorBuilder: (c, e, s) => Icon(isActive ? Icons.people : Icons.people_outline, color: itemColor),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: itemColor, fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
