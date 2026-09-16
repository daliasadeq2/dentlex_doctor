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
import 'Billed_patients.dart';
import 'Reminder_disease.dart';
import 'cracks_and_fractures.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';
import 'dart:ui';

class RaysScreen extends StatefulWidget {
  const RaysScreen({super.key});

  @override
  State<RaysScreen> createState() => _RaysScreenState();
}

class _RaysScreenState extends State<RaysScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 3);
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildUploadCard(),
                            const SizedBox(height: 24),
                            const Text(
                              'سجل الاشعة',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            const SizedBox(height: 16),
                            _buildRayCard(),
                            const SizedBox(height: 16),
                            _buildRayCard(),
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
        } else if (index == 4) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BilledPatientsScreen()));
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

  Widget _buildUploadCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'إضافة صورة أشعة للأسنان والفك',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('فتح اختيار الملفات...')),
              );
            },
            child: CustomPaint(
              painter: DashedBorderPainter(
                color: const Color(0xFFE5E7EB),
                strokeWidth: 1,
                borderRadius: 8,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: const Color(0x0D106970), // #1069700D
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon/uploading.png',
                      width: 24,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.cloud_upload_outlined, color: Color(0xFF106970)),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'اضغط لرفع صورة أو ملف',
                      style: TextStyle(fontSize: 13, color: Color(0xFF6C6C89)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'PNG, JPG, PDF (بحد أقصى 5MB)',
                      style: TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRayCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/ray.png',
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(
                    width: 64, height: 64, color: Colors.grey.shade200,
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '15 ديسمبر 2025، 11:32 ص',
                      style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 10),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'بانوراما',
                      style: TextStyle(
                        fontFamily: 'Graphik Arabic',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.3, // 130%
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'بواسطة: د. محمد عبدالله',
                      style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 152,
                height: 44,
                padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0x1A10B981), width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icon/ii.png', width: 20, height: 20, errorBuilder: (c, e, s) => const Icon(Icons.visibility_outlined, size: 20, color: Color(0xFF8A8AA3))),
                    const SizedBox(width: 8),
                    const Text('عرض', style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 14)),
                  ],
                ),
              ),
              Container(
                width: 151,
                height: 44,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0x14106970), // #10697014
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0x14106970), width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icon/dd.png', width: 20, height: 20, errorBuilder: (c, e, s) => const Icon(Icons.file_download_outlined, size: 20, color: Color(0xFF106970))),
                    const SizedBox(width: 8),
                    const Text('تحميل', style: TextStyle(color: Color(0xFF106970), fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
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

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.borderRadius = 8.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect outer = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final Path path = Path()..addRRect(outer);

    const double dashWidth = 5.0;
    const double dashSpace = 3.0;

    final Path dashedPath = Path();
    for (final PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        dashedPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
