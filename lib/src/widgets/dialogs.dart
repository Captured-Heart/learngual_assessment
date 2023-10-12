// ignore_for_file: inference_failure_on_function_invocation

import 'package:learngual_assessment/app.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showScaffoldSnackBar(SnackBar snackBar) =>
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);

void showScaffoldSnackBarMessage(
  String message, {
  bool isError = false,
  int? duration,
}) =>
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isError ? Icons.cancel : Icons.check_circle,
                color: isError ? LearnGualColor.textError : LearnGualColor.success,
              ),
              Expanded(
                child: Text(
                  message,
                  textAlign: TextAlign.left,
                ),
              ),
            ].rowInPadding(5)),
        duration: Duration(seconds: duration ?? 2),
      ),
    );

void warningDialogs({
  required BuildContext context,
  required String errorMessage,
  VoidCallback? onNegativeAction,
  required VoidCallback onPostiveAction,
  bool hasImage = false,
  String? imgUrl,
  double? height,
  String? title,
}) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          titleTextStyle: AppTextStyle.listTileTitle,
          title: Text(
            title ?? 'Error',
            textScaleFactor: 1.1,
            textAlign: TextAlign.center,
          ).padOnly(bottom: 10),
          content: Row(
            children: [
              if (hasImage == false)
                const SizedBox.shrink()
              else
                cachedNetworkImageWidget(
                  imgUrl: imgUrl,
                  height: height ?? 80,
                ),
              Expanded(
                child: Text(
                  errorMessage,
                  textScaleFactor: 1.1,
                  textAlign: hasImage == true ? TextAlign.left : TextAlign.center,
                ),
              )
            ].rowInPadding(10),
          ).padSymmetric(horizontal: 15),
          contentPadding: const EdgeInsets.only(top: 5),
          actionsAlignment: MainAxisAlignment.spaceAround,
          contentTextStyle: context.theme.textTheme.bodyMedium,
          // actionsPadding: EdgeInsets.zero,
          actions: [
            TextButton(
                onPressed: onNegativeAction ??
                    () {
                      pop(context);
                    },
                style: TextButton.styleFrom(foregroundColor: LearnGualColor.textError),
                child: const Text(TextConstant.cancel)),
            TextButton(onPressed: onPostiveAction, child: const Text(TextConstant.confirm))
          ],
        );
      },
    );

//
Future<void> showAuthBottomSheet({required BuildContext context, String? errorMessage}) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    )),
    builder: (context1) => Consumer(
      builder: (context, ref, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cancel,
              color: LearnGualColor.textError,
              size: 44,
            ),
            ListTile(
              title: const Text(
                'Error',
                textScaleFactor: 1.1,
                textAlign: TextAlign.center,
              ).padOnly(bottom: 10),
              subtitle: Text(
                errorMessage ?? 'check network',
                // 'invalid phone number/password combination',
                textScaleFactor: 1.1,
                textAlign: TextAlign.center,
              ),
            )
          ].columnInPadding(20),
        ).padSymmetric(vertical: 40, horizontal: 30);
      },
    ),
  );
}

String nairaSignString() {
  var format = NumberFormat.simpleCurrency(name: 'NGN');
  return format.currencySymbol;
}
