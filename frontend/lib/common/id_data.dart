class IDData {
  final String firstName;
  final String lastName;
  final String address;
  final String birthDate;
  final String cnp;
  final String idType;

  IDData(
      {required this.firstName,
      required this.lastName,
      required this.address,
      required this.birthDate,
      required this.cnp,
      required this.idType});

  factory IDData.fromJson(Map<String, dynamic> json) {
    return IDData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      birthDate: json['birthDate'],
      cnp: json['cnp'],
      idType: json['idType'],
    );
  }

  String toString() {
    return "firstName: $firstName, lastName: $lastName, address: $address, birthDate: $birthDate, cnp: $cnp, idType: $idType";
  }
}
