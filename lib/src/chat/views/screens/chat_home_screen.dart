import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/src/chat/views/screens/chat_screen.dart';

class ChatHomeScreen extends ConsumerStatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends ConsumerState<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: const BackButton(),
        title: Text(
          TextConstant.chat,
          style: context.textTheme.bodyMedium,
          textScaleFactor: 1.2,
        ),
      ),
      body: Padding(
        padding: AppEdgeInsets.eH20,
        child: Column(
          children: [
            Flexible(
              child: authTextFieldWidget(
                controller: TextEditingController(),
                context: context,
                prefixIcon: const Icon(searchIcon),
                hintText: TextConstant.searchMessages,
              ),
            ),
            Expanded(
              child: ListView(
                padding: AppEdgeInsets.eV8,
                children: [
                  ListTile(
                    onTap: () {
                      navBarPush(
                        context: context,
                        screen: const ChatScreen(appBarTitle: 'Assessment Text'),
                        withNavBar: false,
                      );
                    },
                    leading: const CircleAvatar(),
                    title: const Text('Assessment Test'),
                    subtitle: const Text('Assessment Test'),
                    trailing: Text(
                      dateFormattedWithSlash(DateTime.now()),
                      style: context.textTheme.bodySmall,
                      textScaleFactor: 0.8,
                    ),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
