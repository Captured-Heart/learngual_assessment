import 'package:learngual_assessment/app.dart';

class TextEditingControllerClass {
  final GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInformKey = GlobalKey<FormState>();

  TextEditingController passWordController = TextEditingController();
  TextEditingController passWordController2 = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  // FocusNode ordersFocusNode = FocusNode();

  void clearControllers() {
    passWordController.clear();
    firstNameController.clear();
    passWordController2.clear();
    lastNameController.clear();
    userNameController.clear();
    emailController.clear();
  }
}
