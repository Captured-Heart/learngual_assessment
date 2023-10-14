import 'dart:convert';

import 'package:learngual_assessment/app.dart';

abstract class TextConstant {
  //
  static const appTitle = 'LearnGual';

/*----------------------------------------------------------------------
          SIGN UP SCREEN
-----------------------------------------------------------------------*/
  static const createYourAcct = 'Create your account';
  static const haveAnAcct = "Have an account?";
  static const login = 'Login';
  static const firstName = 'First Name';
  static const enterFullNameAsWritten = 'enter your full name as its written on your id card';
  static const lastName = 'Last Name';
  static const userName = 'Username';
  static const emailAddress = 'Email address';
  static const password = 'Password';
  static const emailHint = 'example@gmail.com';
  static const confirmPassword = 'Confirm Password';
  static const createAccount = 'Create Account';
  static const passwordMustBe = 'password must be at least 6 characters long';
  static const loginToYourAccount = 'Login to your account';
  static const dontHaveAnAcct = "Don't have an account?";

  static const hello = 'Hello';
  static const signOut = 'Sign Out';
  static const search = 'Search';
  static const popularItems = 'Popular Items';
  static const viewAll = 'View All';
  static const getYourSpecialSale = 'Get your special\nsale up to 50%';
  static const shopNow = 'Shop Now';
  static const all = 'All';
  static const fashion = 'Fashion';
  static const sport = 'Sport';
  static const phones = 'Phones';
  static const electronics = 'Electronics';
  static const fashionableShorts = 'Fashionable Shorts';
  static const home = 'Home';
  static const chat = 'Chat';
  static const searchMessages = 'Search messages';
  static const typeSomething = 'Type something';
  static const cancel = 'cancel';
  static const confirm = 'Confirm';
  static const location = 'Location';
  static const profile = 'Profile';
  static String getFullName() {
    var userDetails = SharedPreferencesHelper.getStringPref(SharedPrefKeys.signUpDetails.name);

    var details = jsonDecode(userDetails);
    // ignore: avoid_dynamic_calls
    var fullname = details != null ? '${details['first_name']} ${details['last_name']}' : 'null';
    return fullname;
  }

  static const settings = 'settings';
  static const dark = 'dark';
  static const light = 'light';
  static const theme = 'theme';
  static const areYouSureYouWantToLogOut = 'Are you sure you want to log out?';
  // static const or = 'or';
  // static const or = 'or';// static const or = 'or';
  // static const or = 'or';
  // static const or = 'or';
  // static const or = 'or';
  // static const or = 'or';
  // static const lorem = 'or';
}
