import 'package:flutter/material.dart';
import 'dart:ui';

class RequestTechnicalSupportPage extends StatefulWidget {
  const RequestTechnicalSupportPage({super.key});

  @override
  State<RequestTechnicalSupportPage> createState() => _RequestTechnicalSupportPageState();
}

class _RequestTechnicalSupportPageState extends State<RequestTechnicalSupportPage> {
  String? _fileName;

  void _pickFile() {
    setState(() {
      _fileName = "file_selected.png"; // Simulated selection
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم النقر لرفع الملف')),
    );
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
          child: Container(
            width: 375,
            height: 805,
            decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'طلب الدعم الفني',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Graphik Arabic',
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildRequestFormCard(),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Footer buttons pinned to the bottom with white background
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
                    ),
                    child: _buildFooterButtons(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequestFormCard() {
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
          _buildLabel('عنوان المشكلة'),
          _buildTextField('مشكلة في حفظ بيانات المريض'),
          const SizedBox(height: 16),
          _buildLabel('نوع المشكلة'),
          _buildDropdownField('مشكلة تقنية'),
          const SizedBox(height: 16),
          _buildLabel('درجة الاهمية'),
          _buildDropdownField('منخفضة'),
          const SizedBox(height: 16),
          _buildLabel('وصف المشكلة'),
          _buildTextArea('عند محاولة حفظ الفاتورة يظهر خطأ ولا يتم الحفظ.'),
          const SizedBox(height: 16),
          _buildLabel('إرفاق ملف (اختياري)', isRequired: false),
          _buildUploadArea(),
        ],
      ),
    );
  }

  Widget _buildLabel(String label, {bool isRequired = true}) {
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
            if (isRequired)
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
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

  Widget _buildTextArea(String hint) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: TextField(
        textAlign: TextAlign.right,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF), fontFamily: 'Graphik Arabic'),
          contentPadding: const EdgeInsets.all(12),
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

  Widget _buildUploadArea() {
    return GestureDetector(
      onTap: _pickFile,
      behavior: HitTestBehavior.opaque,
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: const Color(0xFFE5E7EB),
          strokeWidth: 1,
          borderRadius: 8,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0x0D106970),
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
              const SizedBox(height: 8),
              Text(
                _fileName ?? 'اضغط لرفع صورة أو ملف',
                style: const TextStyle(fontSize: 12, color: Color(0xFF6C6C89), fontFamily: 'Graphik Arabic'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Text(
                '(بحد أقصى 5MB) PNG, JPG, PDF',
                style: TextStyle(fontSize: 10, color: Colors.black, fontFamily: 'Graphik Arabic'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 167.5,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF106970),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'ارسال',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Graphik Arabic'),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            width: 167.5,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: const Center(
              child: Text(
                'تجاهل',
                style: TextStyle(color: Color(0xFF374151), fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Graphik Arabic'),
              ),
            ),
          ),
        ),
      ],
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
