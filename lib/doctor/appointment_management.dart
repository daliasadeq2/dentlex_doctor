import 'package:flutter/material.dart';
import 'dashboard.dart';
import '../Patient/Patient.dart';
import 'Add _anew_appointment.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';
import '../Patient/abscess.dart';

class AppointmentManagementScreen extends StatelessWidget {
  const AppointmentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, 
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 375,
            height: 908,
            child: Stack(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
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
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildDateNavigator(),
                                const SizedBox(height: 24),
                                // Separate White container for Room Tabs
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10),
                                    ],
                                  ),
                                  child: _buildRoomTabs(),
                                ),
                                const SizedBox(height: 24),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16.0),
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
                                      _buildDoctorHorizontalList(),
                                      const SizedBox(height: 24),
                                      _buildAppointmentsTitle(),
                                      const SizedBox(height: 16),
                                      _buildTimelineAppointmentList(context),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Fixed "+" button within the 375px container
                Positioned(
                  bottom: 20,
                  right: 19, // Same offset as requested for alignment
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddAppointmentScreen()),
                      );
                    },
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ),
              ],
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

  Widget _buildDateNavigator() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: _buildArrowBox(Icons.keyboard_arrow_right),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الاثنين ، 2 يناير',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      const Text('UTC+2', style: TextStyle(color: Colors.black, fontSize: 10)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.only(top: 4, right: 10, bottom: 4, left: 10),
                        decoration: BoxDecoration(
                          color: const Color(0x3399F6E4),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0x3399F6E4), width: 1),
                        ),
                        child: const Center(
                          child: Text(
                            'اليوم',
                            style: TextStyle(color: Color(0xFF1EA3AF), fontSize: 12, height: 1.2, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: _buildArrowBox(Icons.keyboard_arrow_left),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 45,
            height: 52,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xFFECECEC), width: 1),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('للمواعيد', style: TextStyle(color: Colors.grey, fontSize: 8)),
                Text('16', style: TextStyle(color: Color(0xFF1E6367), fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowBox(IconData icon) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0x1A000000), width: 1),
      ),
      child: Center(
        child: Icon(icon, size: 16, color: Colors.grey.shade600),
      ),
    );
  }

  Widget _buildRoomTabs() {
    return Row(
      children: [
        _buildTab('الكل', true),
        const SizedBox(width: 4),
        Expanded(child: _buildTab('غرفة 1', false)),
        const SizedBox(width: 4),
        Expanded(child: _buildTab('غرفة 2', false)),
      ],
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    if (label == 'الكل' && isSelected) {
      return Container(
        width: 110,
        height: 28,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFF106970),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Center(
          child: Text(
            'الكل',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1E6367) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorHorizontalList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildDoctorItem('د.محمد ابو لبن', 'https://randomuser.me/api/portraits/men/1.jpg', true),
          const SizedBox(width: 12),
          _buildDoctorItem('د.محمد', 'https://randomuser.me/api/portraits/men/2.jpg', false),
          const SizedBox(width: 12),
          _buildDoctorItem('د. صالح الخالدي', 'https://randomuser.me/api/portraits/men/3.jpg', false),
        ],
      ),
    );
  }

  Widget _buildDoctorItem(String name, String imageUrl, bool isSelected) {
    return Container(
      height: 28,
      padding: const EdgeInsets.only(top: 4, right: 10, bottom: 4, left: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0x3399F6E4) : Colors.white,
        borderRadius: BorderRadius.circular(65),
        border: Border.all(color: isSelected ? const Color(0x3399F6E4) : Colors.grey.shade200, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 14, color: Color(0xFF121217), height: 1.4, fontWeight: FontWeight.w400),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentsTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'مواعيد اليوم (5 مرضى)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          'الكل',
          style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
        ),
      ],
    );
  }

  Widget _buildTimelineAppointmentList(BuildContext context) {
    return Column(
      children: [
        _buildAppointmentRow(context, '8:00 ص', 'ساره السعيد', 'تم العلاج', const Color(0xFFE0F2FE), const Color(0xFF14B8A6)),
        _buildAppointmentRow(context, '9:00 ص', 'ساره السعيد', 'قيد العلاج', const Color(0xFFF3EBFC), const Color(0xFFA855F7)),
        _buildAppointmentRow(context, '10:00 ص', 'ساره السعيد', 'قيد العلاج', const Color(0xFFE0FEED), const Color(0xFF10B981)),
      ],
    );
  }

  Widget _buildAppointmentRow(BuildContext context, String time, String patientName, String status, Color bgColor, Color statusColor) {
    Color badgeBgColor = status == 'قيد العلاج' ? const Color(0xFFF0FAFF) : const Color(0xFFEEFBF4);
    Color badgeTextColor = status == 'قيد العلاج' ? const Color(0xFF0075AD) : const Color(0xFF17663A);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // الخط الطولي - تم زيادة السمك ليكون ظاهراً دائماً
                Container(
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                // نص الساعة
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    // جعلنا الخلفية مطابقة تماماً للخلفية الرمادية الفاتحة للمنطقة
                    color: const Color(0xFFF8F9FB),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AbscessScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(patientName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(width: 8),
                              const Icon(Icons.check_box, color: Color(0xFF1E6367), size: 20),
                            ],
                          ),
                          Container(
                            width: 69,
                            height: 24,
                            decoration: BoxDecoration(
                              color: badgeBgColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                status,
                                style: TextStyle(color: badgeTextColor, fontSize: 14, fontWeight: FontWeight.w400, height: 16/14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('حشوة أسنان', style: TextStyle(fontSize: 11)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icon/clock.png', width: 16, height: 16, errorBuilder: (c, e, s) => const Icon(Icons.access_time, color: Colors.grey, size: 16)),
                              const SizedBox(width: 4),
                              const Text('08:00 ص - 08:45 ص', style: TextStyle(color: Colors.grey, fontSize: 11)),
                            ],
                          ),
                          Image.asset('assets/icon/annotation-warning.png', width: 18, height: 18, errorBuilder: (c, e, s) => const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
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
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(12), blurRadius: 10, offset: const Offset(0, -5)),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, 'لوحة تحكم', 'assets/icon/dashborad_bac.png', false),
            _buildNavItem(context, 'إدارة المواعيد', 'assets/icon/calendar-plus.png', true),
            _buildNavItem(context, 'المرضى', 'assets/icon/users-plus.png', false),
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          } else if (label == 'إدارة المواعيد') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AppointmentManagementScreen()),
            );
          } else if (label == 'المرضى') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PatientListScreen()),
            );
          } else if (label == 'المختبر') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LaboratoryAndLaboratoriesRequestPage()),
            );
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
              errorBuilder: (c, e, s) => Icon(
                isActive ? Icons.dashboard : Icons.blur_on,
                color: itemColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: itemColor,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
