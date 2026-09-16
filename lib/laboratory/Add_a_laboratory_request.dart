import 'package:flutter/material.dart';
import 'dart:ui';

class AddALaboratoryRequestPage extends StatefulWidget {
  const AddALaboratoryRequestPage({super.key});

  @override
  State<AddALaboratoryRequestPage> createState() => _AddALaboratoryRequestPageState();
}

class _AddALaboratoryRequestPageState extends State<AddALaboratoryRequestPage> {
  int _teethCount = 3;
  String? _fileName;

  void _pickFile() {
    setState(() {
      _fileName = "file_selected.png"; // Simulated selection
    });
  }

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
            'إضافة امر للمختبر',
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
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('معلومات الطلب'),
                            _buildFormCard([
                              _buildLabel('رقم الطلب'),
                              _buildTextField('123'),
                              const SizedBox(height: 16),
                              _buildLabel('اسم المختبر'),
                              _buildDropdownField('مختبر الشمس'),
                              const SizedBox(height: 16),
                              _buildLabel('نوع العمل المطلوب'),
                              _buildDropdownField('تاج'),
                            ]),
                            const SizedBox(height: 24),
                            _buildSectionTitle('تفاصيل العمل'),
                            _buildFormCard([
                              _buildLabel('نوع المادة'),
                              _buildDropdownField('Zirconia'),
                              const SizedBox(height: 16),
                              _buildLabel('درجة اللون'),
                              _buildDropdownField('B2'),
                              const SizedBox(height: 16),
                              _buildLabel('عدد الاسنان'),
                              _buildCounterField(),
                              const SizedBox(height: 16),
                              _buildLabel('أرقام الأسنان'),
                              _buildTeethNumbersField(),
                            ]),
                            const SizedBox(height: 24),
                            _buildSectionTitle('صور أو ملفات مرفقة (اختياري)', isRequired: false),
                            _buildUploadArea(),
                            const SizedBox(height: 24),
                            _buildSectionTitle('ملاحظات اضافية (اختياري)', isRequired: false),
                            _buildTextArea('نص تجريبي'),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildStickyFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Graphik Arabic',
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
                fontWeight: FontWeight.w500,
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
          hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF), fontFamily: 'Graphik Arabic'),
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
            style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF), fontFamily: 'Graphik Arabic'),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xFF9CA3AF)),
        ],
      ),
    );
  }

  Widget _buildCounterField() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => setState(() => _teethCount++),
            icon: const Icon(Icons.add, size: 20, color: Color(0xFF106970)),
          ),
          Text(
            '$_teethCount',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF374151)),
          ),
          IconButton(
            onPressed: () => setState(() {
              if (_teethCount > 0) _teethCount--;
            }),
            icon: const Icon(Icons.remove, size: 20, color: Color(0xFF106970)),
          ),
        ],
      ),
    );
  }

  Widget _buildTeethNumbersField() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          _buildToothChip('21'),
          const SizedBox(width: 4),
          _buildToothChip('21'),
          const SizedBox(width: 8),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFF106970),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 16),
          ),
          const Spacer(),
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Color(0x9999F6E4),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF106970),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xFF9CA3AF)),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildToothChip(String label) {
    return Container(
      width: 45,
      height: 28,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF374151),
              fontFamily: 'Graphik Arabic',
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.close, size: 10, color: Color(0xFF9CA3AF)),
        ],
      ),
    );
  }

  Widget _buildUploadArea() {
    return GestureDetector(
      onTap: _pickFile,
      behavior: HitTestBehavior.opaque,
      child: CustomPaint(
        painter: DashedBorderPainter(color: const Color(0xFFE5E7EB)),
        child: Container(
          width: double.infinity,
          height: 96,
          decoration: BoxDecoration(
            color: const Color(0x0D106970),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/uploading.png',
                width: 24,
                height: 24,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.cloud_upload_outlined, color: Color(0xFF106970)),
              ),
              const SizedBox(height: 8),
              Text(
                _fileName ?? 'اضغط لرفع ملف',
                style: const TextStyle(fontSize: 12, color: Color(0xFF6C6C89), fontFamily: 'Graphik Arabic'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Text('(بحد أقصى 5MB) PNG, JPG, PDF', style: TextStyle(fontSize: 10, color: Colors.black, fontFamily: 'Graphik Arabic')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextArea(String hint) {
    return Container(
      width: double.infinity,
      height: 96,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      child: TextField(
        maxLines: null,
        expands: true,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF), fontFamily: 'Graphik Arabic'),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildStickyFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildFooterButton('اضافة', isPrimary: true),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildFooterButton('تجاهل', isPrimary: false),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterButton(String label, {required bool isPrimary}) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF106970) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: isPrimary ? null : Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isPrimary ? Colors.white : const Color(0xFF374151),
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'Graphik Arabic',
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  DashedBorderPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color..strokeWidth = 1..style = PaintingStyle.stroke;
    final RRect rrect = RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(8));
    final Path path = Path()..addRRect(rrect);
    for (final pathMetric in path.computeMetrics()) {
      double distance = 0;
      while (distance < pathMetric.length) {
        canvas.drawPath(pathMetric.extractPath(distance, distance + 5), paint);
        distance += 8;
      }
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
