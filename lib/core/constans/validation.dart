mixin InputValidationMixin {
  // bool isPasswordValid(String password) => password.length == 6;
  bool isPassValid(String password) =>
      RegExp("^(?=.{6,32}\$)").hasMatch(password);
  //require 1 number, 1 letter upper case, 1 letter lower case,1 special character

  bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-30]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }
}
