import 'dart:convert';

import 'package:learngual_assessment/app.dart';

class L10n {
  static final all = [
    const Locale('en', 'US'),
    const Locale('es', 'ES'),
  ];

  static String getFlag(String locale) {
    switch (locale) {
      case 'US':
        return '🇺🇸';
      case 'ES':
        return '🇪🇸';
      default:
        return '🇺🇸';
    }
  }

  static String getLang(String locale) {
    switch (locale) {
      case 'US':
        return ' English';
      case 'ES':
        return ' Spanish';
      default:
        return ' English';
    }
  }
}

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
  static const locale = 'locale';
  static const areYouSureYouWantToLogOut = 'Are you sure you want to log out?';
  static const testingTheAssessment = 'Testing the assessment websocket here';
  static const testingTheCoinbase = 'Testing the coinbase websocket here';
  static const checkInfo = 'Check Info';
  static const inThisScreenIImplemented = 'In this screen, i implemented the web Socket Url';
  static const forWord = 'for';
  static const itsAnEchoWebsocket = "It's an Echo webscoket";
  static const usingTheSameMethod =
      'Using the same methods i used for the assessment link, and i got positive results.';
  static const hereWeCanPassAMessage =
      'Here, we can pass a message to the textfield, and click on the "Send" button';
  static const infoGuide = 'Info/Guide';
  static const toTestThisWebsocket = 'To test this websocket, click on the send button';
  static const ignoreUsingTheTextField =
      'Ignore using the textfield as this websocket needs a particular type of "Event"';
  static const thisParticularEvent =
      'This particular "Event" is already hardcoded into the send Button.';
  static const theEventPassedToTheCoinbase = 'The event passed to the Coinbase Webscocket';
  static const youCanCheckLine = 'you can check line ';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
  // static const lorem = 'or';
}
