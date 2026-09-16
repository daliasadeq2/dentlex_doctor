import 'package:flutter/material.dart';
import 'Billing_and_payments.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  int _activeTabIndex = 1;

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
          title: const Text(
            'الفواتير والمدفوعات',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Image.asset(
              'assets/icon/back.png',
              width: 24,
              height: 24,
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              constraints: const BoxConstraints(minHeight: 805), // حل مشكلة الانسبكتور: استخدام minHeight بدلاً من height الثابت
              decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0), // تم تعديل البادينج ليتناسب مع عرض 375
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'الفواتير والمدفوعات',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildTabs(),
                      const SizedBox(height: 16),
                      _buildSearchAndTools(),
                      const SizedBox(height: 24),
                      _buildPaymentCard(),
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

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabItem('الفواتير', 0),
          const SizedBox(width: 6),
          _buildTabItem('المدفوعات', 1),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    bool isSelected = _activeTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _activeTabIndex = index);
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BillingAndPaymentsPage()),
          );
        }
      },
      child: Container(
        width: 165.5,
        height: 32,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF106970) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: isSelected
              ? const Border(top: BorderSide(color: Color(0xFF106970), width: 1))
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
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
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Graphik Arabic',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.625,
                      color: Color(0xFF1F2937),
                    ),
                    decoration: const InputDecoration(
                      hintText: 'ابحث باسم المستخدم, البريد ..',
                      hintStyle: TextStyle(
                        fontFamily: 'Graphik Arabic',
                        fontSize: 16,
                        color: Colors.grey,
                      ),
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
        const SizedBox(width: 10),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF106970),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Image.asset(
              'assets/icon/printbackground.png',
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'رقم الفاتورة: 1234',
              style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'شراء قفازات',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'الجهة المدفوع لها: مركز طيبة',
            style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              width: 295,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPriceItem('قيمة الفاتورة', '90 ش'),
                      _buildPriceItem('المبلغ المطلوب دفعه', '90 ش'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPriceItem('المبلغ المدفوع', '45 ش'),
                      _buildPriceItem('المبلغ المتبقي', '45 ش', isRed: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceItem(String label, String price, {bool isRed = false}) {
    return SizedBox(
      width: 120,
      height: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Graphik Arabic',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.4,
              color: Color(0xFF6B7280),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(
              fontFamily: 'Graphik Arabic',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isRed ? const Color(0xFFEF4444) : const Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }
}
