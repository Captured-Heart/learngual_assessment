// ignore_for_file: inference_failure_on_function_invocation

import 'package:learngual_assessment/app.dart';

Future<void> checkIfShowDialog({
  required BuildContext context,
  required String title,
  required Widget content,
  required String prefKey,
}) async {
  var showDialogBool = SharedPreferencesHelper.getBoolPref(prefKey);
  if (showDialogBool) {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              width: context.sizeWidth(0.9),
              child: content,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  SharedPreferencesHelper.setBoolPref(
                    prefKey,
                    value: !showDialogBool,
                  );

                  Navigator.of(context).pop();
                },
                child:  Text(TextConstant.confirm.tr()),
              ),
            ],
          );
        });
  }
}
