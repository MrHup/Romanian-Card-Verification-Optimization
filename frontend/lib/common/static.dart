import 'package:frontend/common/cr_data.dart';
import 'package:frontend/common/id_data.dart';

class GlobalStatic {
  static String b64Img = "";
  static IDData idData = IDData(
      firstName: "",
      lastName: "",
      address: "",
      birthDate: "",
      cnp: "",
      idType: "");
  static CRData crData = CRData(
      alert_index: "",
      found_person_dob: "",
      found_person_name: "",
      full_name: "",
      pic_source: "",
      source: "",
      source_link: "");
}
