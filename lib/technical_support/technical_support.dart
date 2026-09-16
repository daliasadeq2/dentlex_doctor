import 'package:flutter/material.dart';

class TechnicalSupportPage extends StatefulWidget {
  const TechnicalSupportPage({super.key});

  @override
  State<TechnicalSupportPage> createState() => _TechnicalSupportPageState();
}

class _TechnicalSupportPageState extends State<TechnicalSupportPage> {
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
            'الدعم الفني',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              constraints: const BoxConstraints(minHeight: 805),
              decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'الدعم الفني',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSearchAndTools(),
                      const SizedBox(height: 16),
                      _buildRequestButton(),
                      const SizedBox(height: 24),
                      _buildSupportCard(),
                      const SizedBox(height: 16),
                      _buildSupportCard(),
                      const SizedBox(height: 40),
                    ],
                  ),
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
        // Search Field (Right-most in RTL)
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
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Filter Button
        Container(
          width: 44,
          height: 44,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Image.asset(
            'assets/icon/filter.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildRequestButton() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF106970),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'طلب الدعم الفني',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSupportCard() {
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
              const Text(
                'TK-44132',
                style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
              ),
              _buildYellowTag(), // Moved to the left (Visual Left in RTL)
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'مشكلة تزامن التقويم مع Google Calendar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Image.asset('assets/icon/user.png', width: 16, height: 16),
              const SizedBox(width: 4),
              const Text(
                'قام بها: د. أحمد منصور',
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Image.asset('assets/icon/calendar.png', width: 16, height: 16),
              const SizedBox(width: 4),
              const Text(
                '15 ديسمبر 2025, 11:32 ص',
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight, // Reversed from centerLeft to centerRight
            child: _buildTealButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildYellowTag() {
    return Container(
      width: 67,
      height: 22,
      decoration: BoxDecoration(
        color: const Color(0x1AFACC15),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: const Center(
        child: Text(
          'قيد المعالجة',
          style: TextStyle(
            fontFamily: 'Graphik Arabic',
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: Color(0xFFFACC15),
            height: 1.2,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget _buildTealButton() {
    return Container(
      width: 67,
      height: 22,
      decoration: BoxDecoration(
        color: const Color(0xFF106970), // Updated to #106970
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: const Center(
        child: Text(
          'قيد المعالجة',
          style: TextStyle(
            fontFamily: 'Graphik Arabic',
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: Colors.white,
            height: 1.2,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
