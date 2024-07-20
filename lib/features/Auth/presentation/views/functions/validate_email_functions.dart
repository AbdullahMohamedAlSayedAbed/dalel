String? validateEmailFunctions(String? value) {
  if (value!.isEmpty) {
    return "Enter Your Email Address";
  } else if (!value.contains("@")) {
    return "Enter Valid Email Address";
  } else if (!value.contains(".com")) {
    return "Enter Valid Email Address";
  }
  return null;
}
