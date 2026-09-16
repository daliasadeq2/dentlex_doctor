import 'package:flutter/material.dart';

class LaboratoryDetailsPage extends StatelessWidget {
  const LaboratoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          // Reversing back button again as requested (Moving to actions to appear on the left in RTL)
          leading: IconButton(
            icon: Image.asset(
              'assets/icon/back.png',
              width: 24,
              height: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'تفاصيل',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Graphik Arabic',
            ),
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 375),
            decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Right Group: Info Button
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(16.13),
                            ),
                            child: const Icon(Icons.info_outline, color: Color(0xFF9CA3AF), size: 24),
                          ),
                          const SizedBox(width: 8),
                          // Info column: Name + Status + Order ID
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Doctor Name
                                    const Flexible(
                                      child: Text(
                                        'د. ليان عبد الرحمن',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1F2937),
                                          fontFamily: 'Graphik Arabic',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    // Status Tag
                                    Container(
                                      width: 66,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        color: const Color(0x1AFACC15),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'قيد التنفيذ',
                                          style: TextStyle(
                                            color: Color(0xFFFACC15),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Graphik Arabic',
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                // Order ID
                                const Text(
                                  'رقم الطلب LAB-2025-014',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9CA3AF),
                                    fontFamily: 'Graphik Arabic',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Download button (Left side)
                          Image.asset(
                            'assets/icon/dow.png',
                            width: 32,
                            height: 32,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFF3F4F6)),
                    // Grid section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: _buildInfoItem('اسم المريض', 'نسرين صالح')),
                              Expanded(child: _buildInfoItem('اسم المعمل', 'معمل النجاح')),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(child: _buildInfoItem('نوع الطلب', 'Zircon Crown')),
                              Expanded(child: _buildInfoItem('الاسنان المطلوبة', '11 - 21')),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(child: _buildInfoItem('التكلفة الاجمالية', '  100 ₪', valueColor: const Color(0xFF106970))),
                              Expanded(child: _buildInfoItem('تاريخ الانشاء', '15 ديسمبر 2025')),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(child: _buildInfoItem('تاريخ الإستلام المتوقع', '15 ديسمبر 2025')),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Notes section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(minHeight: 80),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0x0D106970), // #1069700D
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFF106970).withOpacity(0.1), width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'ملاحظات الطبيب',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF056770),
                                fontFamily: 'Graphik Arabic',
                                height: 1.4,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'اللون A2 + ضبط الإطباق',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6B7280),
                                fontFamily: 'Graphik Arabic',
                                height: 1.4,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, {Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9CA3AF),
            fontFamily: 'Graphik Arabic',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: valueColor ?? const Color(0xFF1F2937),
            fontFamily: 'Graphik Arabic',
          ),
        ),
      ],
    );
  }
}
