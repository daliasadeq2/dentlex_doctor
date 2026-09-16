import 'package:flutter/material.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('المعلومات الشخصية'),
                    _buildFormCard([
                      _buildLabel('الاسم كامل'),
                      _buildTextField('نص تجريبي'),
                      const SizedBox(height: 16),
                      _buildLabel('الجنس'),
                      _buildDropdownField('اختر الجنس'),
                      const SizedBox(height: 16),
                      _buildLabel('الدولة'),
                      _buildDropdownField('نص تجريبي'),
                      const SizedBox(height: 16),
                      _buildLabel('المدينة'),
                      _buildDropdownField('نص تجريبي'),
                    ]),
                    const SizedBox(height: 24),
                    _buildSectionTitle('معلومات التواصل'),
                    _buildFormCard([
                      _buildLabel('رقم الهاتف للتواصل'),
                      _buildPhoneField(),
                      const SizedBox(height: 16),
                      _buildLabel('البريد الالكتروني'),
                      _buildTextField('نص تجريبي'),
                    ]),
                    const SizedBox(height: 24),
                    _buildSectionTitle('معلومات الحساب'),
                    _buildFormCard([
                      _buildLabel('الدور الوظيفي'),
                      _buildDropdownField('اختر الدور الوظيفي'),
                      const SizedBox(height: 16),
                      _buildLabel('تفعيل الدور'),
                      _buildTextFieldWithAssetIcon('معطل', 'assets/icon/ey.png'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLabel('إنشاء كلمة مرور للحساب'),
                          Row(
                            children: [
                              Image.asset('assets/icon/refresh.png', width: 12, height: 12),
                              const SizedBox(width: 4),
                              const Text(
                                'تولوليد تلقائي',
                                style: TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      _buildTextFieldWithAssetIcon('*** *** ***', 'assets/icon/ey.png'),
                    ]),
                    const SizedBox(height: 24),
                    _buildSectionTitle('الصلاحيات'),
                    _buildPermissionItem('إدارة الإعدادات العامة للنظام'),
                    _buildPermissionItem('الدعم الفني'),
                    _buildPermissionItem('إدارة الشكاوي والملاحظات'),
                    _buildPermissionItem('تدريب الموظفين والتطوير المهني'),
                    const SizedBox(height: 32),
                    _buildFooterButtons(),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black, // تم التغيير للأسود
        ),
      ),
    );
  }

  Widget _buildFormCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF374151),
                fontFamily: 'Graphik Arabic',
              ),
            ),
            const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hint) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xFF9CA3AF)),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/Union.png', width: 10, height: 10, color: const Color(0xFF374151)),
              const SizedBox(width: 4),
              const Text('970', style: TextStyle(fontSize: 12, color: Color(0xFF374151))),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildTextField('000 000 000'),
        ),
      ],
    );
  }

  Widget _buildTextFieldWithAssetIcon(String hint, String assetPath) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
          ),
          Image.asset(assetPath, width: 18, height: 18, color: const Color(0xFF9CA3AF)),
        ],
      ),
    );
  }

  Widget _buildPermissionItem(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13, color: Color(0xFF374151)),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xFF9CA3AF)),
        ],
      ),
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      children: [
        // زر اضافة - Teal on the Right in RTL
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF106970),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'اضافة',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16), // Gap 16px
        // زر تجاهل - White on the Left in RTL
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: const Center(
              child: Text(
                'تجاهل',
                style: TextStyle(color: Color(0xFF374151), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
