import 'package:flutter/material.dart';

class LaboratoryAndLaboratoriesRequestPage extends StatefulWidget {
  const LaboratoryAndLaboratoriesRequestPage({super.key});

  @override
  State<LaboratoryAndLaboratoriesRequestPage> createState() => _LaboratoryAndLaboratoriesRequestPageState();
}

class _LaboratoryAndLaboratoriesRequestPageState extends State<LaboratoryAndLaboratoriesRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Image.asset(
              'assets/icon/back.png',
              width: 24,
              height: 24,

            ),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: const Text(
            'طلبات المختبر والمعامل',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Graphik Arabic',
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: 375,
            height: 812,
            decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'طلبات المختبر والمعامل',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Graphik Arabic',
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSearchAndTools(),
                    const SizedBox(height: 16),
                    _buildAddRequestButton(),
                    const SizedBox(height: 24),
                    _buildRequestCard(
                      status: 'قيد التفعيل',
                      id: 'LAB-2025-014',
                      patientName: 'نسرين صالح',
                      doctorName: 'د. أحمد منصور',
                      date: '15 ديسمبر 2025, 11:32 ص',
                      requestType: 'veneer',
                      statusColor: const Color(0xFFFACC15),
                      statusBgColor: const Color(0x1AFACC15),
                      statusWidth: 71,
                    ),
                    const SizedBox(height: 16),
                    _buildRequestCard(
                      status: 'مكتملة',
                      id: 'LAB-2025-014',
                      patientName: 'نسرين صالح',
                      doctorName: 'د. أحمد منصور',
                      date: '15 ديسمبر 2025, 11:32 ص',
                      requestType: 'veneer',
                      statusColor: const Color(0xFF22C55E),
                      statusBgColor: const Color(0x1A22C55E),
                      statusWidth: 51,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAndTools() {
    return Row(
      children: [
        // Search Field (Right-most in visual layout for RTL)
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon/search.png',
                  width: 18,
                  height: 18,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'ابحث باسم المستخدم, البريد ..',
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey, fontFamily: 'Graphik Arabic'),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 6), // تقليل المسافة
        // Filter Button (Middle)
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Center(
            child: Image.asset(
              'assets/icon/filter.png',
              width: 22,
              height: 22,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 6), // تقليل المسافة
        // Print Button (Left-most)
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Image.asset(
              'assets/icon/pr_bac.png',
              width: 50,
              height: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.print, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildAddRequestButton() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF106970),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.white),
            const SizedBox(width: 8),
            const Text(
              'إضافة طلب للمختبر',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Graphik Arabic',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard({
    required String status,
    required String id,
    required String patientName,
    required String doctorName,
    required String date,
    required String requestType,
    required Color statusColor,
    required Color statusBgColor,
    required double statusWidth,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
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
            children: [
              Text(
                id,
                style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF), fontFamily: 'Graphik Arabic'),
              ),
              _buildStatusTag(status, statusColor, statusBgColor, statusWidth),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'اسم المريض: $patientName',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
              fontFamily: 'Graphik Arabic',
            ),
          ),
          const SizedBox(height: 12),
          _buildIconInfo('assets/icon/user.png', 'الطبيب: $doctorName'),
          const SizedBox(height: 8),
          _buildIconInfo('assets/icon/calendar.png', date),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: _buildRequestTypeTag(requestType),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTag(String text, Color color, Color bgColor, double width) {
    return Container(
      width: width,
      height: 22,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Graphik Arabic',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: color,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildRequestTypeTag(String text) {
    return Container(
      width: 112,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0x9999F6E4), // #99F6E499
        borderRadius: BorderRadius.circular(42),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'نوع الطلب: ',
                style: TextStyle(
                  fontFamily: 'Graphik Arabic',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF106970),
                ),
              ),
              TextSpan(
                text: text,
                style: const TextStyle(
                  fontFamily: 'Graphik Arabic',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF106970),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconInfo(String assetPath, String text) {
    return Row(
      children: [
        Image.asset(assetPath, width: 16, height: 16, color: const Color(0xFF9CA3AF)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280), fontFamily: 'Graphik Arabic'),
        ),
      ],
    );
  }
}
