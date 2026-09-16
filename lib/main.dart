import 'package:dentlex_doctor/Patient/clinical_examination.dart' show ClinicalExaminationScreen;
import 'package:flutter/material.dart';
import 'Invoice_and_payments/payments.dart';
import 'Patient/Add_areminder.dart';
import 'Patient/New Note _Mobile.dart';
import 'Patient/New_note.dart';
import 'Patient/Other_cases.dart';
import 'Patient/Patient.dart';
import 'Patient/Add_Patient.dart';
import 'Patient/dish_problems.dart';
import 'Patient/structural_defects_and_problems.dart';
import 'doctor/Add _anew_appointment.dart';
import 'Patient/Add_aprescription.dart';
import 'doctor/Add_new_appointment_details.dart';
import 'Patient/Billed_patients.dart';
import 'Patient/cracks_and_fractures.dart';
import 'Patient/Measurements_dental implants.dart';
import 'Patient/Patient_Profile.dart';
import 'Patient/impacted teeth.dart';
import 'Patient/missing teeth.dart';
import 'Patient/abscess.dart';
import 'Patient/Reminder_disease.dart';
import 'doctor/appointment_management.dart';
import 'Patient/Dental_pulp_cases.dart';
import 'doctor/dashboard.dart';
import 'Patient/rays.dart';
import 'laboratory/Add_a_laboratory_request.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dentlex Doctor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      home: const OtherCasesScreen (),
    );
  }
}

//