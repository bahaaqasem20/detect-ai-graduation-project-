class CrimeReport {
  String caseName;
  String caseNumber;
  String crimeSource;
  String crimeDate;
  String crimeTime;
  String crimeLocation;

  String victimFirstName;
  String victimLastName;
  String victimGender;
  String victimAge;
  String victimID;
  String victimStatus;
  String victimJob;
  String victimAddress;

  String victimDoing;
  String expectedLocation;
  String victimValuables;
  String victimBelongings;
  String victimHealth;

  String criminalRecord;
  String lastPerson;
  String victimBehavior;

  CrimeReport({
    required this.caseName,
    required this.caseNumber,
    required this.crimeSource,
    required this.crimeDate,
    required this.crimeTime,
    required this.crimeLocation,
    required this.victimFirstName,
    required this.victimLastName,
    required this.victimGender,
    required this.victimAge,
    required this.victimID,
    required this.victimStatus,
    required this.victimJob,
    required this.victimAddress,
    required this.victimDoing,
    required this.expectedLocation,
    required this.victimValuables,
    required this.victimBelongings,
    required this.victimHealth,
    required this.criminalRecord,
    required this.lastPerson,
    required this.victimBehavior,
  });

  Map<String, dynamic> toJson() => {
    'case_name': caseName,
    'case_number': caseNumber,
    'crime_source': crimeSource,
    'crime_date': crimeDate,
    'crime_time': crimeTime,
    'crime_location': crimeLocation,
    'victim_first_name': victimFirstName,
    'victim_last_name': victimLastName,
    'victim_gender': victimGender,
    'victim_age': victimAge,
    'victim_id': victimID,
    'victim_status': victimStatus,
    'victim_job': victimJob,
    'victim_address': victimAddress,
    'victim_doing': victimDoing,
    'expected_location': expectedLocation,
    'victim_valuables': victimValuables,
    'victim_belongings': victimBelongings,
    'victim_health': victimHealth,
    'criminal_record': criminalRecord,
    'last_person_seen': lastPerson,
    'victim_behavior': victimBehavior,
  };
}
