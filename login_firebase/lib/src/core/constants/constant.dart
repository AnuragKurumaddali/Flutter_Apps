class Constant {
  const Constant._();
  static const assetsPath = "assets";
  static const imagesPath = "$assetsPath/images";
  static const splashIcon = "$imagesPath/splash_logo.svg";
  static const signInBg = "$imagesPath/signin_bg.svg";
  static const signUpBg = "$imagesPath/signup_bg.svg";

  static final RegExp emailRegExp =  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp mobileNumRegExp =  RegExp(r"^\+49[1-9][0-9]{1,14}$");


  //Firebase Collection constants
  static const String userTBL = "tblUsers";

}