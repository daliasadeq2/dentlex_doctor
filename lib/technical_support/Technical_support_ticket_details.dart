import 'package:flutter/material.dart';

class TechnicalSupportTicketDetailsPage extends StatefulWidget {
  const TechnicalSupportTicketDetailsPage({super.key});

  @override
  State<TechnicalSupportTicketDetailsPage> createState() => _TechnicalSupportTicketDetailsPageState();
}

class _TechnicalSupportTicketDetailsPageState extends State<TechnicalSupportTicketDetailsPage> {
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
              color: Colors.black,
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: const Text(
            'الدعم الفني',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Graphik Arabic',
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              constraints: const BoxConstraints(minHeight: 805),
              decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'تفاصيل تذكرة الدعم الفني',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Graphik Arabic',
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTicketDetailsCard(),
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

  Widget _buildTicketDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "رقم التذكرة" on the right in RTL
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'رقم التذكرة',
                    style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF), fontFamily: 'Graphik Arabic'),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'CLN-45231',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F2937), fontFamily: 'Graphik Arabic'),
                  ),
                ],
              ),
              // "عالي" on the left in RTL
              _buildPriorityBadge('عالي'),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 54),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0x0D106970), // #1069700D
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoItem('حالة التذكرة', 'مفتوحة', valueColor: const Color(0xFF22C55E)),
                _buildInfoItem('نوع التذكرة', 'مشكلة في المواعيد', isTicketType: true, alignment: CrossAxisAlignment.start),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'وصف المشكلة',
            style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF), fontFamily: 'Graphik Arabic'),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0x0D106970), // #1069700D
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'عند محاولة إضافة موعد جديد للمريض النظام لا يستجيب ويعلق الصفحة.',
              style: TextStyle(
                fontSize: 14, 
                color: Color(0xFF4B5563), 
                height: 1.5, 
                fontFamily: 'Graphik Arabic'
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: _buildButton('إغلاق التذكرة', isPrimary: true),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildButton('تغيير حالة التذكرة', isPrimary: false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityBadge(String text) {
    return Container(
      width: 36,
      height: 22,
      decoration: BoxDecoration(
        color: const Color(0x1A22C55E), // #22C55E1A
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Graphik Arabic',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xFF22C55E),
            height: 1.2,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, {Color? valueColor, bool isTicketType = false, CrossAxisAlignment alignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: alignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF), fontFamily: 'Graphik Arabic'),
          textAlign: alignment == CrossAxisAlignment.start ? TextAlign.right : TextAlign.left,
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Graphik Arabic',
            fontWeight: isTicketType ? FontWeight.w400 : FontWeight.bold,
            fontSize: isTicketType ? 14 : 13,
            height: isTicketType ? 1.4 : 1.2,
            color: valueColor ?? const Color(0xFF1F2937),
          ),
          textAlign: alignment == CrossAxisAlignment.start ? TextAlign.right : TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildButton(String text, {required bool isPrimary}) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF106970) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: isPrimary ? null : Border.all(color: const Color(0xFFD1D5DB)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isPrimary ? Colors.white : const Color(0xFF374151),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Graphik Arabic',
          ),
        ),
      ),
    );
  }
}
