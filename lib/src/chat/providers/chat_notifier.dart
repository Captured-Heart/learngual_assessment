import 'package:learngual_assessment/app.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final webSocketProvider1 = Provider<WebSocketChannel>((ref) {
  // Replace with your WebSocket server URL
  return IOWebSocketChannel.connect('ws://your_websocket_server_url');
});

class ChatNotifier extends StateNotifier<List<String>> {
  ChatNotifier(this.ref, [List<String>? state]) : super(state ?? []);
  final WidgetRef ref;

  // Send a new message to the WebSocket server
  Future<void> sendMessage(String message) async {
    final webSocket = ref.read(webSocketProvider1);
    webSocket.sink.add(message);
  }

  // Listen to WebSocket for incoming messages and update state
  void listenToWebSocket() {
    final webSocket = ref.read(webSocketProvider1);
    webSocket.stream.listen((message) {
      // state = [...state, message];
    });
  }
}
