import 'package:dentlex_doctor/Patient/rays.dart';
import 'package:flutter/material.dart';
import 'Measurements_dental implants.dart';
import 'Patient_Profile.dart';
import '../doctor/appointment_management.dart';
import 'clinical_examination.dart';
import '../doctor/dashboard.dart';
import 'Patient.dart';
import 'Dental_pulp_cases.dart';
import 'structural_defects_and_problems.dart';
import 'cracks_and_fractures.dart';
import 'abscess.dart';
import 'missing teeth.dart';
import 'Billed_patients.dart';
import 'Reminder_disease.dart';
import 'cracks_and_fractures.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';

class ImpactedTeethScreen extends StatefulWidget {
  const ImpactedTeethScreen({super.key});

  @override
  State<ImpactedTeethScreen> createState() => _ImpactedTeethScreenState();
}

class _ImpactedTeethScreenState extends State<ImpactedTeethScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isTherapeutic = false;
  String activeFilter = 'الأسنان المطمورة';

  final LayerLink _impactedTeethLayerLink = LayerLink();
  OverlayEntry? _impactedTeethOverlayEntry;
  bool _isImpactedTeethMenuOpen = false;

  void _toggleImpactedTeethMenu() {
    if (_isImpactedTeethMenuOpen) {
      _closeImpactedTeethMenu();
    } else {
      _openImpactedTeethMenu();
    }
  }

  void _openImpactedTeethMenu() {
    setState(() {
      _isImpactedTeethMenuOpen = true;
      activeFilter = 'الأسنان المطمورة';
    });
    _impactedTeethOverlayEntry = _createImpactedTeethOverlayEntry();
    Overlay.of(context).insert(_impactedTeethOverlayEntry!);
  }

  void _closeImpactedTeethMenu() {
    if (_impactedTeethOverlayEntry != null) {
      _impactedTeethOverlayEntry!.remove();
      _impactedTeethOverlayEntry = null;
      setState(() {
        _isImpactedTeethMenuOpen = false;
      });
    }
  }

  OverlayEntry _createImpactedTeethOverlayEntry() {
    final List<String> cases = [
      'انطمار جزئي',
      'انطمار كامل',
      'انطمار أفقي',
      'انطمار عمودي',
      'انطمار مائل للأمام',
      'انطمار مائل للخلف',
    ];

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeImpactedTeethMenu,
              behavior: HitTestBehavior.opaque,
              child: Container(),
            ),
          ),
          Positioned(
            width: 200,
            child: CompositedTransformFollower(
              link: _impactedTeethLayerLink,
              showWhenUnlinked: false,
              offset: const Offset(-80, 45),
              child: Material(
                elevation: 4,
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: cases.map((choice) {
                        return StatefulBuilder(
                          builder: (context, setPopupState) {
                            bool isItemSelected = activeFilter == choice;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  activeFilter = choice;
                                });
                                setPopupState(() {});
                                _impactedTeethOverlayEntry?.markNeedsBuild();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: isItemSelected ? const Color(0xFFF7F7F8) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      choice,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    if (isItemSelected)
                                      Image.asset(
                                        'assets/icon/tru.png',
                                        width: 16,
                                        height: 16,
                                        errorBuilder: (c, e, s) => const Icon(Icons.check, color: Color(0xFF106970), size: 16),
                                      ),
                                    if (!isItemSelected) const SizedBox(width: 16),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 375,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'محمد علي',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildTabBar(context),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xFFF8F9FB),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10)],
                              ),
                              child: Column(
                                children: [
                                  _buildActionTabs(),
                                  const SizedBox(height: 16),
                                  _buildServiceFilters(),
                                  const SizedBox(height: 16),
                                  _buildAgeAndToothFilters(),
                                  const SizedBox(height: 16),
                                  activeFilter == 'التقويم' ? _buildDentalImageChart() : _buildToothGrid(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'تفاصيل الدواء',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            _buildDetailsTabs(),
                            const SizedBox(height: 16),
                            _buildMeasurementCard(),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'تفاصيل المرضى',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/icon/back.png',
                width: 24,
                height: 24,
                errorBuilder: (c, e, s) => const Icon(Icons.arrow_forward, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: const Color(0xFF106970),
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16),
      tabAlignment: TabAlignment.start,
      padding: EdgeInsets.zero,
      labelColor: const Color(0xFF106970),
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PatientProfileScreen()));
        } else if (index == 1) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ClinicalExaminationScreen()));
        } else if (index == 2) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DentalPulpCasesScreen()));
        } else if (index == 3) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RaysScreen()));
        } else if (index == 4) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BilledPatientsScreen()));
        }
      },
      tabs: const [
        Tab(text: 'الملف الشخصي'),
        Tab(text: 'فحص سريري'),
        Tab(text: 'المخطط السني'),
        Tab(text: 'صور اشعة'),
        Tab(text: 'فواتير'),
      ],
    );
  }

  Widget _buildActionTabs() {
    return Container(
      height: 44,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFECECEC)),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() {
                isTherapeutic = false;
                activeFilter = 'الأسنان المطمورة';
              }),
              child: _buildActionTab('الحالات المرضية', !isTherapeutic),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() {
                isTherapeutic = true;
                activeFilter = 'الترميمات';
              }),
              child: _buildActionTab('الحالات العلاجية', isTherapeutic),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTab(String label, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF106970) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF868C98),
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildServiceFilters() {
    if (isTherapeutic) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('الترميمات', activeFilter == 'الترميمات'),
            const SizedBox(width: 8),
            _buildFilterChip('علاج الجذور', activeFilter == 'علاج الجذور'),
            const SizedBox(width: 8),
            _buildFilterChip('التيجان والجسور', activeFilter == 'التيجان والجسور'),
            const SizedBox(width: 8),
            _buildFilterChip('زراعة الأسنان', activeFilter == 'زراعة الأسنان'),
            const SizedBox(width: 8),
            _buildFilterChip('التجميل', activeFilter == 'التجميل'),
            const SizedBox(width: 8),
            _buildFilterChip('التقويم', activeFilter == 'التقويم'),
            const SizedBox(width: 8),
            _buildFilterChip('جراحة فم', activeFilter == 'جراحة فم'),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip(
              'حالات اللب السني', 
              activeFilter == 'حالات اللب السني',
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DentalPulpCasesScreen())),
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              'الخراج', 
              activeFilter == 'الخراج',
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AbscessScreen())),
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              'الأسنان المفقودة', 
              activeFilter == 'الأسنان المفقودة',
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MissingTeethScreen())),
            ),
            const SizedBox(width: 8),
            CompositedTransformTarget(
              link: _impactedTeethLayerLink,
              child: _buildImpactedTeethFilterButton('الأسنان المطمورة', activeFilter == 'الأسنان المطمورة' || activeFilter.contains('انطمار') || _isImpactedTeethMenuOpen),
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              'التشققات والكسور', 
              activeFilter == 'التشققات والكسور',
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CracksAndFracturesScreen())),
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              'العيوب والمشاكل البنوية', 
              activeFilter == 'العيوب والمشاكل البنوية',
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StructuralDefectsScreen())),
            ),
            const SizedBox(width: 8),
            _buildFilterChip('مشاكل الاطباق', activeFilter == 'مشاكل الاطباق'),
            const SizedBox(width: 8),
            _buildFilterChip('حالات اخرى', activeFilter == 'حالات اخرى'),
          ],
        ),
      );
    }
  }

  Widget _buildImpactedTeethFilterButton(String label, bool isActive) {
    return GestureDetector(
      onTap: _toggleImpactedTeethMenu,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFF7F7F8) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isActive ? const Border(bottom: BorderSide(color: Color(0xFF056770), width: 2)) : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF106970) : Colors.black,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isActive, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => setState(() => activeFilter = label),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFF7F7F8) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isActive 
            ? const Border(bottom: BorderSide(color: Color(0xFF056770), width: 2))
            : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF106970) : Colors.black,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAgeAndToothFilters() {
    return Row(
      children: [
        Container(
          width: 150,
          height: 36,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F8FA),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFF5F5F5)),
          ),
          child: Row(
            children: [
              Expanded(child: _buildAgeTab('بالغ', true)),
              Expanded(child: _buildAgeTab('طفل', false)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFD1D1DB)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('فلترة الأسنان حسب', style: TextStyle(color: Colors.black, fontSize: 12)),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAgeTab(String label, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isActive ? Border.all(color: const Color(0xFFF5F5F5)) : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF106970) : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildDentalImageChart() {
    return Column(
      children: [
        Image.asset(
          'assets/images/Charts.png',
          width: double.infinity,
          fit: BoxFit.contain,
          errorBuilder: (c, e, s) => const Text('Tooth Chart Image Missing'),
        ),
      ],
    );
  }

  Widget _buildToothGrid() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text('الفك العلوي', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF4B4B4B))),
          const SizedBox(height: 8),
          _buildToothRow([11, 12, 13, 14, 15, 16, 17, 18], [15]),
          const SizedBox(height: 4),
          _buildToothRow([21, 22, 23, 24, 25, 26, 27, 28], []),
          const SizedBox(height: 16),
          const Text('الفك السفلي', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF4B4B4B))),
          const SizedBox(height: 8),
          _buildToothRow([41, 42, 43, 44, 45, 46, 47, 48], []),
          const SizedBox(height: 4),
          _buildToothRow([31, 32, 33, 34, 35, 36, 37, 38], []),
        ],
      ),
    );
  }

  Widget _buildToothRow(List<int> numbers, List<int> selected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: numbers.map((n) {
        bool isSelected = selected.contains(n);
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF106970) : Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Center(
            child: Text(
              n.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDetailsTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildDetailTab('الحالة', false),
          const SizedBox(width: 12),
          _buildDetailTab('وصفة', false),
          const SizedBox(width: 12),
          _buildDetailTab('ملاحظات', false),
          const SizedBox(width: 12),
          _buildDetailTab('قياسات', true),
          const SizedBox(width: 12),
          _buildDetailTab('مختبر', false),
          const SizedBox(width: 12),
          _buildDetailTab('تذكير', false),
          const SizedBox(width: 12),
          _buildDetailTab('تشخيص', false),
        ],
      ),
    );
  }

  Widget _buildDetailTab(String label, bool isActive) {
    if (isActive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF106970),
          borderRadius: BorderRadius.circular(64),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      );
    }
    return Container(
      width: 62,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0x1A106970),
        borderRadius: BorderRadius.circular(64),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xB2106970),
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  Widget _buildMeasurementCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'رقم السن المعالج : ', style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 14)),
                    const TextSpan(text: '36', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0x80C2FAEF), // #C2FAEF80
                  borderRadius: BorderRadius.circular(42),
                ),
                child: const Text(
                  'MB1',
                  style: TextStyle(color: Color(0xFF106970), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              width: 311,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _buildInfoColumn('طول العمل', '25 mm', alignment: CrossAxisAlignment.start),
                  Expanded(
                    child: Center(
                      child: _buildInfoColumn('قراءة جهاز الأبيكس لوكيتور', '(Apex) 1.0', width: 147.5, alignment: CrossAxisAlignment.center),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    'أنشأ بواسطة:',
                    style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 11),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'د. محمد عبدالله',
                    style: TextStyle(color: Color(0xFF106970), fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ],
              ),
              const Text(
                '15 ديسمبر 2025، 11:32 ص',
                style: TextStyle(color: Color(0xFF8A8AA3), fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, {double? width, CrossAxisAlignment alignment = CrossAxisAlignment.center}) {
    return SizedBox(
      width: width,
      height: 48,
      child: Column(
        crossAxisAlignment: alignment,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF8A8AA3), fontSize: 11)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}
