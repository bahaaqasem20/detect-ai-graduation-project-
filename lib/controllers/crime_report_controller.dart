import 'package:get/get.dart';
import '../services/api_service.dart';

class CrimeReportController extends GetxController {
  // case data
  var caseName = ''.obs;
  var caseNumber = ''.obs;
  var crimeSource = ''.obs;
  var crimeDate = ''.obs;
  var crimeTime = ''.obs;
  var crimeLocation = ''.obs;

  // victim data
  var victimFirstName = ''.obs;
  var victimLastName = ''.obs;
  var victimGender = ''.obs;
  var victimAge = ''.obs;
  var victimID = ''.obs;
  var victimStatus = ''.obs;
  var victimJob = ''.obs;
  var victimAddress = ''.obs;
  var victimDoing = ''.obs;
  var expectedLocation = ''.obs;
  var victimValuables = ''.obs;
  var victimBelongings = ''.obs;
  var victimHealth = ''.obs;
  var criminalRecord = ''.obs;
  var lastPerson = ''.obs;
  var victimBehavior = ''.obs;

  // 🔹 القوائم (الشهود والمتهمين)
  var eyewitnesses = <Map<String, String>>[].obs;
  var accused = <Map<String, String>>[].obs;

  // add a new eyewitness
  void addEyewitness(Map<String, String> witness) {
    if (witness.isNotEmpty) {
      eyewitnesses.add(witness);
    }
  }

  // add a new accused
  void addAccused(Map<String, String> accusedPerson) {
    if (accusedPerson.isNotEmpty) {
      accused.add(accusedPerson);
    }
  }

  // 🔹 رفع التقرير بالكامل
  Future<void> submitReport() async {
    print("🚀 Starting upload...");

    // 1️⃣ إرسال بيانات القضية أولاً
    final caseData = {
      "case_name": caseName.value,
      "case_number": caseNumber.value,
      "crime_source": crimeSource.value,
      "crime_date": crimeDate.value,
      "crime_time": crimeTime.value,
      "crime_location": crimeLocation.value,
    };

    final caseId = await ApiService.createCase(caseData);
    if (caseId == null) {
      print('❌ Failed to create case. Stopping upload.');
      return;
    }

    print('✅ Case created successfully with ID: $caseId');

    // 2️⃣ إرسال بيانات الضحية
    final victimData = {
      "case_id": caseId,
      "first_name": victimFirstName.value,
      "last_name": victimLastName.value,
      "gender": victimGender.value,
      "age": victimAge.value,
      "id_number": victimID.value,
      "status": victimStatus.value,
      "job": victimJob.value,
      "address": victimAddress.value,
      "doing": victimDoing.value,
      "expected_location": expectedLocation.value,
      "valuables": victimValuables.value,
      "belongings": victimBelongings.value,
      "health": victimHealth.value,
      "criminal_record": criminalRecord.value,
      "last_person_seen": lastPerson.value,
      "behavior": victimBehavior.value,
    };
    await ApiService.createVictim(victimData);

    // 3️⃣ إرسال الشهود
    for (final witness in eyewitnesses) {
      final witnessData = {...witness, "case_id": caseId.toString()};
      await ApiService.createWitness(witnessData);
    }

    // 4️⃣ إرسال المتهمين
    for (final acc in accused) {
      final accusedData = {...acc, "case_id": caseId.toString()};
      await ApiService.createAccused(accusedData);
    }

    print("✅ Full crime report uploaded successfully!");
  }
}
