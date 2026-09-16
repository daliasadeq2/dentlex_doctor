


import 'package:flutter/material.dart';
import 'Measurements_dental implants.dart';
import 'Patient_Profile.dart';
import '../doctor/appointment_management.dart';
import 'clinical_examination.dart';
import '../doctor/dashboard.dart';
import 'Patient.dart';
import 'Dental_pulp_cases.dart';
import 'abscess.dart';
import 'missing teeth.dart';
import 'impacted teeth.dart';
import 'cracks_and_fractures.dart';
import 'rays.dart';
import 'Billed_patients.dart';
import 'Reminder_disease.dart';
import '../laboratory/Laboratory_and_laboratories_request.dart';

class StructuralDefectsScreen extends StatefulWidget {
const StructuralDefectsScreen({super.key});

@override
State<StructuralDefectsScreen> createState() => _StructuralDefectsScreenState();
}

class _StructuralDefectsScreenState extends State<StructuralDefectsScreen> with SingleTickerProviderStateMixin {
late TabController _tabController;
bool isTherapeutic = false;
String activeFilter = 'العيوب والمشاكل البنوية';

final LayerLink _defectsLayerLink = LayerLink();
OverlayEntry? _defectsOverlayEntry;
bool _isDefectsMenuOpen = false;

void _toggleDefectsMenu() {
if (_isDefectsMenuOpen) {
_closeDefectsMenu();
} else {
_openDefectsMenu();
}
}

void _openDefectsMenu() {
setState(() {
_isDefectsMenuOpen = true;
activeFilter = 'العيوب والمشاكل البنوية';
});
_defectsOverlayEntry = _createDefectsOverlayEntry();
Overlay.of(context).insert(_defectsOverlayEntry!);
}

void _closeDefectsMenu() {
if (_defectsOverlayEntry != null) {
_defectsOverlayEntry!.remove();
_defectsOverlayEntry = null;
setState(() {
_isDefectsMenuOpen = false;
});
}
}

OverlayEntry _createDefectsOverlayEntry() {
final List<String> cases = [
'نقص تكون مينا الأسنان',
'تآكل الأسنان بالاحتكاك',
'تآكل الأسنان بالفرك',
'تآكل الأسنان الكيميائي',
'تسوس الأسنان',
'تسوس الجذور',
'حواف ترميم مفتوحة',
'زيادة في مادة الترميم',
'ترميم متآكل',
];

return OverlayEntry(
builder: (context) => Stack(
children: [
Positioned.fill(
child: GestureDetector(
onTap: _closeDefectsMenu,
behavior: HitTestBehavior.opaque,
child: Container(),
),
),
Positioned(
width: 220,
child: CompositedTransformFollower(
link: _defectsLayerLink,
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
_defectsOverlayEntry?.markNeedsBuild();
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
Container(
color: Colors.white,
child: Column(
children: [
_buildHeader(context),
const Padding(
padding: EdgeInsets.symmetric(horizontal: 16.0),
child: Align(
alignment: Alignment.centerRight,
child: Text(
'محمد علي',
style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
),
),
),
const SizedBox(height: 12),
_buildTabBar(context),
],
),
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
    git status),
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
activeFilter = 'العيوب والمشاكل البنوية';
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
_buildFilterChip(
'الأسنان المطمورة',
activeFilter == 'الأسنان المطمورة',
onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ImpactedTeethScreen())),
),
const SizedBox(width: 8),
_buildFilterChip(
'التشققات والكسور',
activeFilter == 'التشققات والكسور',
onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CracksAndFracturesScreen())),
),
const SizedBox(width: 8),
CompositedTransformTarget(
link: _defectsLayerLink,
child: _buildDefectsFilterButton('العيوب والمشاكل البنوية', activeFilter == 'العيوب والمشاكل البنوية' || _isDefectsMenuOpen || [
'نقص تكون مينا الأسنان',
'تآكل الأسنان بالاحتكاك',
'تآكل الأسنان بالفرك',
'تآكل الأسنان الكيميائي',
'تسوس الأسنان',
'تسوس الجذور',
'حواف ترميم مفتوحة',
'زيادة في مادة الترميم',
'ترميم متآكل'
].contains(activeFilter)),
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

Widget _buildDefectsFilterButton(String label, bool isActive) {
return GestureDetector(
onTap: _toggleDefectsMenu,
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
onTap: onTap ?? () {
setState(() => activeFilter = label);
},
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
}

