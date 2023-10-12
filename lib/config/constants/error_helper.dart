import 'package:learngual_assessment/app.dart';

class ErrorHelper {
  static String failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return FailureToMessage.kServerFailureMessage.message;

      case ParsingJsonFailure:
        return FailureToMessage.kParsingJsonFailureMessage.message;

      case MakingCallFailure:
        return FailureToMessage.kMakingCallMessage.message;
      default:
        return 'Unexpected error';
    }
  }
}

enum FailureToMessage {
  kServerFailureMessage('Oops! Something went wrong. Check your netowrk'),
  kMakingCallMessage('Error while trying to make call'),

  kParsingJsonFailureMessage('Oops! We encountered an issue while processing the data');

  const FailureToMessage(this.message);

  final String message;
}
