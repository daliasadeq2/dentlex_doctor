import 'package:flutter/material.dart';
import 'appointment_management.dart';
import '../Patient/Patient.dart';
import '../Patient/abscess.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _buildHeader(),
                    ),
                    Container(
                      width: double.infinity,
                      color: const Color(0xFFF8F9FB),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildOverviewHeader(),
                          const SizedBox(height: 12),
                          _buildOverviewGrid(),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                _buildAppointmentsHeader(),
                                const SizedBox(height: 16),
                                _buildRoomTabs(),
                                const SizedBox(height: 16),
                                _buildAppointmentList(context),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildRequestedServicesSection(),
                          const SizedBox(height: 24),
                          _buildMonthlyIncomeSection(),
                          const SizedBox(height: 24),
                          _buildNotificationsSection(),
                          const SizedBox(height: 24),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'الحجوزات',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildSearchAndActions(),
                          const SizedBox(height: 16),
                          _buildPatientCard(context),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1A1C1E),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
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
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Text('👋', style: TextStyle(fontSize: 16)),
              ],
            ),
            const Text(
              'محمد خالد',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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

  Widget _buildOverviewHeader() {
    return const Text(
      'نظرة عامة',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildOverviewGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 167 / 60,
      children: [
        _buildOverviewCard(
          value: '50',
          label: 'مواعيد اليوم',
          imageBeforeValue: 'assets/icon/red.png',
        ),
        _buildOverviewCard(
          value: '13',
          label: 'جلسات مكتملة',
          bottomImage: 'assets/icon/Vector 20.png',
        ),
        _buildOverviewCard(
          value: '50',
          label: 'جلسات معلقة',
        ),
        _buildOverviewCard(
          value: '38',
          label: 'عدم الحضور',
          imageBeforeValue: 'assets/icon/red.png',
        ),
      ],
    );
  }

  Widget _buildOverviewCard({
    required String value,
    required String label,
    String? imageBeforeValue,
    String? bottomImage,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, bottom: 4, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (imageBeforeValue != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Image.asset(imageBeforeValue, width: 16, height: 16,
                            errorBuilder: (c, e, s) => const Icon(Icons.trending_up, color: Colors.red, size: 14)),
                      ),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
          if (bottomImage != null)
            Positioned(
              left: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8)),
                child: Image.asset(
                  bottomImage,
                  width: 100,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => const SizedBox(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAppointmentsHeader() {
    return Row(
      children: [
        const Text(
          'مواعيد ، اليوم',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset(
              'assets/icon/pluse.png',
              width: 42,
              height: 42,
              errorBuilder: (c, e, s) => const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Image.asset(
          'assets/icon/gind_backg.png',
          width: 44,
          height: 44,
          fit: BoxFit.contain,
          errorBuilder: (c, e, s) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const Icon(Icons.calendar_today_outlined, size: 20, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildRoomTabs() {
    return Container(
      width: double.infinity,
      height: 36,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Expanded(child: _buildTab('غرفة 1', false)),
            const SizedBox(width: 4),
            Expanded(child: _buildTab('غرفة 2', true)),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isSelected ? [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 4,
          )
        ] : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentList(BuildContext context) {
    return Column(
      children: [
        _buildTimeSlot('08:00 ص', isHighlighted: true),
        _buildAppointmentCard(
          context,
          'فحص أسنان دوري',
          'محمد حلمي ، 08:00 ص - 08:30 ص',
          const Color(0xFFE0F2FE),
          const Color(0xFF2196F3),
          'assets/icon/icon_det.png',
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          context,
          'مراجعة تقويم أسنان دورية',
          'محمد حلمي ، 08:30 ص - 09:00 ص',
          const Color(0xFFE0FEF4),
          const Color(0xFF4CAF50),
          'assets/icon/icon_rev.png',
        ),
        const SizedBox(height: 16),
        _buildTimeSlot('09:00 ص', isBadge: true),
        _buildAppointmentCard(
          context,
          'خلع أسنان',
          'محمد حلمي ، 08:00 ص - 08:30 ص',
          const Color(0xFFE0F2FE),
          const Color(0xFF03A9F4),
          'assets/icon/icon_out.png',
        ),
      ],
    );
  }

  Widget _buildTimeSlot(String time, {bool isHighlighted = false, bool isBadge = false}) {
    if (isBadge) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 79,
              height: 27,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF1EA3AF),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  time,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
                child: Divider(
                  color: Color(0x268A8AA3),
                  thickness: 1,
                )
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            time,
            style: TextStyle(
              color: isHighlighted ? const Color(0xFF6B7280) : Colors.grey.shade400,
              fontSize: 12,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (!isHighlighted) ...[
            const SizedBox(width: 8),
            const Expanded(child: Divider()),
          ],
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context, String title, String subtitle, Color bgColor, Color iconColor, String iconAsset) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AbscessScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        height: 84,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: Image.asset(iconAsset, width: 55, height: 55, errorBuilder: (c, e, s) => Icon(Icons.medical_services_outlined, color: iconColor, size: 40)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestedServicesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'أكثر الخدمات طلباً',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildLegendItem('الشهر الماضي', const Color(0xFF34B3F1), textColor: Colors.grey),
              const SizedBox(width: 16),
              _buildLegendItem('الشهر الحالي', Colors.black, textColor: Colors.black),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.asset(
              'assets/images/Chart.png',
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Center(child: Text('مخطط بياني')),
            ),
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 240,
              height: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('تقويم', style: TextStyle(color: Color(0xA1474B4E), fontSize: 10, fontWeight: FontWeight.w400)),
                  Text('حشوات', style: TextStyle(color: Color(0xA1474B4E), fontSize: 10, fontWeight: FontWeight.w400)),
                  Text('فحص', style: TextStyle(color: Color(0xA1474B4E), fontSize: 10, fontWeight: FontWeight.w400)),
                  Text('خلع', style: TextStyle(color: Color(0xA1474B4E), fontSize: 10, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color, {required Color textColor}) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(color: textColor, fontSize: 12)),
      ],
    );
  }

  Widget _buildMonthlyIncomeSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'الدخل الشهري',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 136,
                height: 35,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('النصف الأول لـ 2025', style: TextStyle(color: Colors.grey, fontSize: 10)),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/images/Group 3.png',
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Center(child: Text('مخطط الدخل')),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                child: Center(
                  child: SizedBox(
                    width: 240,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('يناير', style: TextStyle(color: Color(0xFF474B4E), fontSize: 10, fontWeight: FontWeight.w400)),
                        Text('فبراير', style: TextStyle(color: Color(0xFF474B4E), fontSize: 10, fontWeight: FontWeight.w400)),
                        Text('مارس', style: TextStyle(color: Color(0xFF474B4E), fontSize: 10, fontWeight: FontWeight.w400)),
                        Text('أبريل', style: TextStyle(color: Color(0xFF474B4E), fontSize: 10, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF8A8AA3), width: 1),
                ),
                child: const Center(
                  child: Icon(Icons.keyboard_arrow_left, size: 16, color: Color(0xFF8A8AA3)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'الإشعارات',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                'الكل',
                style: TextStyle(
                  color: Color(0xFF7047EB),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 24/14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildNotificationItem(
            RichText(
              textAlign: TextAlign.right,
              text: const TextSpan(
                style: TextStyle(fontSize: 16, height: 26/16, color: Color(0xFF4B4B4B)),
                children: [
                  TextSpan(text: 'تم '),
                  TextSpan(text: 'إنهاء الاشتراك', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' لعيادة النور، يرجى التجديد لتجنب توقف الخدمات.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            RichText(
              textAlign: TextAlign.right,
              text: const TextSpan(
                style: TextStyle(fontSize: 16, height: 26/16, color: Color(0xFF4B4B4B)),
                children: [
                  TextSpan(text: 'تذكرة الدعم #2849 مفتوحة لأكثر من '),
                  TextSpan(text: '48 ساعة', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '، يرجى المراجعة'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            RichText(
              textAlign: TextAlign.right,
              text: const TextSpan(
                style: TextStyle(fontSize: 16, height: 26/16, color: Color(0xFF4B4B4B)),
                children: [
                  TextSpan(text: 'فشل '),
                  TextSpan(text: 'التكامل الخارجي', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' مع خدمة الـ API في '),
                  TextSpan(text: 'وحدة المخزون', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '، يرجى فحص الإعدادات.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(Widget textWidget) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/icon/bell.png', width: 24, height: 24, errorBuilder: (c, e, s) => const Icon(Icons.notifications_none_outlined, color: Colors.grey, size: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget,
                const SizedBox(height: 4),
                const Text(
                  '5 دقيقة',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndActions() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF3F4F6)),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon/search.png',
                  width: 20,
                  height: 20,
                  errorBuilder: (c, e, s) => const Icon(Icons.search, color: Colors.grey),
                ),
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
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF3F4F6)),
          ),
          child: Center(
            child: Image.asset(
              'assets/icon/filter.png',
              width: 45,
              height: 45,
              errorBuilder: (c, e, s) => const Icon(Icons.filter_alt_outlined, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Image.asset(
          'assets/icon/printbackground.png',
          width: 45,
          height: 45,
          fit: BoxFit.contain,
          errorBuilder: (c, e, s) => const Icon(Icons.print, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPatientCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'اسم المريض: نسرين صالح',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1A1C1E)),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'الطبيب: د. أحمد منصور',
                    style: TextStyle(color: Color(0xFF868C98), fontSize: 14),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 22,
                decoration: BoxDecoration(
                  color: const Color(0x1A22C55E),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    'مكتمل',
                    style: TextStyle(
                      color: Color(0xFF22C55E),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE0FEF4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'الخدمة: حشوة اسنان',
                style: TextStyle(
                  color: Color(0xFF106970),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 312,
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0x80F5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('تاريخ الموعد', style: TextStyle(color: Color(0xFF868C98), fontSize: 11)),
                        SizedBox(height: 2),
                        Text('25 Sep 2024', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1A1C1E))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('وقت الموعد', style: TextStyle(color: Color(0xFF868C98), fontSize: 11)),
                        SizedBox(height: 2),
                        Text('09:00 ص', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1A1C1E))),
                      ],
                    ),
                  ),
                ],
              ),
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.dashboard, 'لوحة التحكم', true),
            _buildNavItem(Icons.calendar_month, 'المواعيد', false),
            _buildNavItem(Icons.people, 'المرضى', false),
            _buildNavItem(Icons.settings, 'الإعدادات', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF1EA3AF) : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF1EA3AF) : Colors.grey,
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}