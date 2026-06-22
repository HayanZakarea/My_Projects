
class Validator {

  static String? requiredText(String? value){
    if(value == null || value.isEmpty){
      return "field is required";
    }
    return null;
  }

  static String? requiredInt(String? value){
    if(value == null || value.isEmpty){
      return "field is required";
    }
    if(int.tryParse(value) == null ){
      return "field must be int";
    }
    if(int.parse(value) < 0 ){
      return "field must grater than 0";
    }
    return null;
  }


}