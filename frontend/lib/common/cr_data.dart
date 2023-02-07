class CRData {
  final double alert_index;
  final String found_person_dob;
  final String found_person_name;
  final String full_name;
  final String pic_source;
  final String source;
  final String source_link;

  CRData(
      {required this.alert_index,
      required this.found_person_dob,
      required this.found_person_name,
      required this.full_name,
      required this.pic_source,
      required this.source,
      required this.source_link});

  factory CRData.fromJson(Map<String, dynamic> json) {
    return CRData(
      alert_index: json['alert_index'],
      found_person_dob: json['found_person_dob'],
      found_person_name: json['found_person_name'],
      full_name: json['full-name'],
      pic_source: json['pic_source'],
      source: json['source'],
      source_link: json['source_link'],
    );
  }

  String toString() {
    return "alert_index: $alert_index, found_person_dob: $found_person_dob, found_person_name: $found_person_name, full_name: $full_name, pic_source: $pic_source, source: $source, source_link: $source_link";
  }
}
