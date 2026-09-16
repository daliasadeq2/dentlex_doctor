import 'package:flutter/material.dart';
import 'Patient_Profile.dart';
import 'Dental_pulp_cases.dart';
import '../doctor/dashboard.dart';
import '../doctor/appointment_management.dart';
import 'Patient.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';
import 'rays.dart';
import 'Billed_patients.dart';

class ClinicalExaminationScreen extends StatefulWidget {
  const ClinicalExaminationScreen({super.key});

  @override
  State<ClinicalExaminationScreen> createState() => _ClinicalExaminationScreenState();
}

class _ClinicalExaminationScreenState extends State<ClinicalExaminationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
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
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xFFF8F9FB),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            _buildExpansionCard(
                              'الشكوى الرئيسية',
                              _buildMainComplaintContent(),
                            ),
                            const SizedBox(height: 12),
                            _buildExpansionCard(
                              'التاريخ الطبي',
                              _buildMedicalHistoryContent(),
                            ),
                            const SizedBox(height: 12),
                            _buildExpansionCard(
                              'التاريخ السني',
                              _buildDentalHistoryContent(),
                            ),
                            const SizedBox(height: 12),
                            _buildExpansionCard(
                              'الفحص خارج الفم',
                              _buildExtraOralContent(),
                            ),
                            const SizedBox(height: 12),
                            _buildExpansionCard(
                              'فحص الأنسجة داخل الفم',
                              const SizedBox(),
                            ),
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
            'ادارة المرضى',
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PatientProfileScreen()),
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DentalPulpCasesScreen()),
          );
        } else if (index == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RaysScreen()),
          );
        } else if (index == 4) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BilledPatientsScreen()),
          );
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

  Widget _buildExpansionCard(String title, Widget content) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          iconColor: Colors.grey,
          collapsedIconColor: Colors.grey,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          children: [content],
        ),
      ),
    );
  }

  Widget _buildMainComplaintContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('من ماذا يعاني المريض', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildInputContainer(
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'تورم في الوجه الجهة اليسرى',
              hintStyle: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMedicalHistoryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('الأمراض التي يعاني منها', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildChipsContainer([
          _buildChip('سكر الدم'),
          const SizedBox(width: 8),
          _buildChip('سكر الدم'),
        ]),
      ],
    );
  }

  Widget _buildDentalHistoryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('الزيارات السنية السابقة', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildInputContainer(
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              '15 ديسمبر 2025، 11:32 ص',
              style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('العلاجات السابقة', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildChipsContainer([
          _buildChip('سكر الدم'),
          const SizedBox(width: 8),
          _buildChip('سكر الدم'),
        ]),
        const SizedBox(height: 16),
        const Text('رد فعل المريض تجاه التخدير الموضعي', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildInputContainer(
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'لم يبدي المريض اي رد فعل غير طبيعي',
              hintStyle: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExtraOralContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSmallField('اللثة', 'طبيعية'),
        const SizedBox(height: 12),
        _buildSmallField('اللسان', 'طبيعية'),
        const SizedBox(height: 12),
        _buildSmallField('بطانة الخد Buccal mucosa', 'طبيعية'),
        const SizedBox(height: 12),
        _buildSmallField('أرضية الفم', 'طبيعية'),
      ],
    );
  }

  Widget _buildSmallField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        _buildInputContainer(
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputContainer({required Widget child}) {
    return Container(
      height: 44,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD1D1DB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  Widget _buildChipsContainer(List<Widget> chips) {
    return Container(
      width: 323,
      height: 44,
      padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD1D1DB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ...chips,
          const Spacer(),
          _buildAddButton(),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFF106970),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.add, color: Colors.white, size: 18),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      width: 84,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0x1A106970),
        borderRadius: BorderRadius.circular(84),
        border: Border.all(color: const Color(0x33106970)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.close, size: 12, color: Color(0xFF8A8AA3)),
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
