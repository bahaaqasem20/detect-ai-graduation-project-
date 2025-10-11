import 'package:get/get.dart';

class CrimeReportController extends GetxController {
  // Crime basic info
  var caseName = ''.obs;
  var caseNumber = ''.obs;
  var crimeSource = ''.obs;
  var crimeDate = ''.obs;
  var crimeTime = ''.obs;
  var crimeLocation = ''.obs;

  // Victim info
  var victimFirstName = ''.obs;
  var victimLastName = ''.obs;
  var victimGender = ''.obs;
  var victimAge = ''.obs;
  var victimID = ''.obs;
  var victimStatus = ''.obs;
  var victimJob = ''.obs;
  var victimAddress = ''.obs;

  // Related info
  var victimDoing = ''.obs;
  var expectedLocation = ''.obs;
  var victimValuables = ''.obs;
  var victimBelongings = ''.obs;
  var victimHealth = ''.obs;

  // Additional notes
  var criminalRecord = ''.obs;
  var lastPerson = ''.obs;
  var victimBehavior = ''.obs;

  // Eyewitnesses and Accused as list of maps
  var eyewitnesses = <Map<String, String>>[].obs;
  var accused = <Map<String, String>>[].obs;

  // Add an eyewitness (all fields as Map)
  void addEyewitness(Map<String, String> witness) {
    if (witness.isNotEmpty) {
      eyewitnesses.add(witness);
    }
  }

  // Add an accused (all fields as Map)
  void addAccused(Map<String, String> accusedPerson) {
    if (accusedPerson.isNotEmpty) {
      accused.add(accusedPerson);
    }
  }

  // Upload data to backend
  Map<String, dynamic> toJson() {
    return {
      "case_name": caseName.value,
      "case_number": caseNumber.value,
      "crime_source": crimeSource.value,
      "crime_date": crimeDate.value,
      "crime_time": crimeTime.value,
      "crime_location": crimeLocation.value,
      "victim_first_name": victimFirstName.value,
      "victim_last_name": victimLastName.value,
      "victim_gender": victimGender.value,
      "victim_age": victimAge.value,
      "victim_id": victimID.value,
      "victim_status": victimStatus.value,
      "victim_job": victimJob.value,
      "victim_address": victimAddress.value,
      "victim_doing": victimDoing.value,
      "expected_location": expectedLocation.value,
      "victim_valuables": victimValuables.value,
      "victim_belongings": victimBelongings.value,
      "victim_health": victimHealth.value,
      "criminal_record": criminalRecord.value,
      "last_person_seen": lastPerson.value,
      "victim_behavior": victimBehavior.value,
      "eyewitnesses": eyewitnesses.toList(),
      "accused": accused.toList(),
    };
  }
}
