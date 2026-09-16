import 'package:flutter/material.dart';
import 'Dental_pulp_cases.dart';
import 'clinical_examination.dart';
import '../doctor/dashboard.dart';
import '../doctor/appointment_management.dart';
import 'Patient.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';
import 'rays.dart';
import 'Billed_patients.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Text(
                      'محمد علي',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildTabBar(context),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF8F9FB),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            _buildProfileCard(),
                            const SizedBox(height: 16),
                            _buildStatsGrid(),
                            const SizedBox(height: 24),
                            _buildInfoForm(),
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
            'تفاصيل المرضى',
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
        if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ClinicalExaminationScreen()),
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

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icon/per.png',
                width: 64,
                height: 64,
                errorBuilder: (c, e, s) => Container(
                  width: 64, height: 64, color: Colors.grey.shade200,
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'محمد علي',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'رقم الهوية الشخصية : 425789356',
                    style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSmallActionButton('اضافة تذكر'),
              _buildSmallActionButton('وصفة طبية'),
              _buildSmallActionButton('ملاحظة جديدة'),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              width: 311,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF106970),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/message.png', width: 20, height: 20, errorBuilder: (c, e, s) => const Icon(Icons.message, color: Colors.white, size: 20)),
                        const SizedBox(width: 8),
                        const Text(
                          'ارسال رسالة',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallActionButton(String label) {
    return Container(
      width: 89,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0x0D106970), // #1069700D
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0x1A106970), width: 1), // #1069701A
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Color(0xFF106970), fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildStatBox(
                  'إجمالي الدفعات',
                  '370 ش',
                  isPrimary: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatBox(
                  'إجمالي الفواتير',
                  '3',
                  isPrimary: true,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildStatBox(
                  'آخر موعد زيارة',
                  '15 ديسمبر 2025, 11:32 ص',
                  isSecondary: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatBox(
                  'عدد الخدمات المتلقاة',
                  '3',
                  isSecondary: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatBox(String label, String value, {bool isPrimary = false, bool isSecondary = false}) {
    Color bgColor = Colors.white;
    Color borderColor = const Color(0xFFD1D1DB);
    if (isPrimary) {
      bgColor = const Color(0xFFECFDFA);
      borderColor = const Color(0xFF99F6E4);
    } else if (isSecondary) {
      bgColor = const Color(0xFFF5FBFF);
      borderColor = const Color(0xFFE0F2FE);
    }

    return Container(
      width: 167.5,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 11)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1.2,
              fontFamily: 'Graphik Arabic',
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldLabel('إسم المريض كاملاً'),
          _buildInput('علي احمد'),
          const SizedBox(height: 16),
          _buildFieldLabel('رقم الهوية الشخصية'),
          _buildInput('000000000'), 
          const SizedBox(height: 16),
          _buildFieldLabel('العمر'),
          _buildDropdownInput('24 سنة'),
          const SizedBox(height: 16),
          _buildFieldLabel('الجنس'),
          _buildDropdownInput('اختار الجنس'),
          const SizedBox(height: 16),
          _buildFieldLabel('رقم الهاتف'),
          _buildPhoneInput(),
          const SizedBox(height: 16),
          _buildFieldLabel('رقم هاتف بديل'),
          _buildPhoneInput(),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF121217))),
    );
  }

  Widget _buildInput(String value) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD1D1DB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(value, style: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 13)),
      ),
    );
  }

  Widget _buildDropdownInput(String value) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD1D1DB)),
        borderRadius: BorderRadius.circular(8),
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

  Widget _buildPhoneInput() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD1D1DB)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, size: 22, color: Color(0xFF8A8AA3)), 
              SizedBox(width: 4),
              Text('970', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD1D1DB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Text('000 000 000', style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 13)),
            ),
          ),
        ),
      ],
    );
  }
}
