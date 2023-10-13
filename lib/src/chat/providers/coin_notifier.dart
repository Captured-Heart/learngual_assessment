// // ignore_for_file: unnecessary_lambdas

// import 'dart:convert';

// import 'package:learngual_assessment/app.dart';
// import 'package:learngual_assessment/src/chat/models/domain/coins_model.dart';
// import 'package:learngual_assessment/src/chat/views/screens/chat_screen.dart';
// import 'package:web_socket_channel/io.dart';

// final coinWebSocketProvider = StreamProvider.autoDispose<CoinsModel>((ref) async* {
//   log('i am in the stream provider');

//   final channel = ref.read(webSocketProvider);
//   yield* coinWebStream(channel!, ref);
// });

// Stream<CoinsModel> coinWebStream(
//     IOWebSocketChannel channel, StreamProviderRef<CoinsModel> ref) async* {
//   var stream = channel.stream.map<CoinsModel>((event) {
//     var mappedEvent = json.encode(event);
//     log('event: $event');
//     var op = jsonDecode(mappedEvent);
//     var ff = cast<Map<String, dynamic>>(op);
//     return CoinsModel.fromJson(ff);
//   });

//   yield* stream;
// }
