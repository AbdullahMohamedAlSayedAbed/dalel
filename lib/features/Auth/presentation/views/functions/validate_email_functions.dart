String? validateEmailFunctions(String? value) {
  if (value!.isEmpty) {
    return "Enter Your Email Address";
  } else if (!value.contains("@")) {
    return "must contain @";
  } else if (!value.contains(".com")) {
    return "must contain .com";
  } 
  return null;
}
