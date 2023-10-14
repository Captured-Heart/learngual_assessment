import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/config/api_urls.dart';
import 'package:learngual_assessment/src/chat/views/screens/chat_assessment_screen.dart';

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
          TextConstant.chat.tr(),
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
                hintText: TextConstant.searchMessages.tr(),
              ),
            ),
            Expanded(
              child: ListView(
                padding: AppEdgeInsets.eV8,
                children: [
                  //FOR THE ASSESSMENT
                  ListTile(
                    onTap: () {
                      navBarPush(
                        context: context,
                        screen: const ChatAssessmentScreen(),
                        withNavBar: false,
                      );
                    },
                    leading: const CircleAvatar(),
                    title: const Text('Assessment Test'),
                    subtitle:  Text(TextConstant.testingTheAssessment.tr()),
                    trailing: Text(
                      dateFormattedWithSlash(DateTime.now()),
                      style: context.textTheme.bodySmall,
                      textScaleFactor: 0.8,
                    ),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                  ),

                  //
                  //FOR COINBASE
                  ListTile(
                    onTap: () {
                      navBarPush(
                        context: context,
                        screen: const ChatCoinsScreen(),
                        withNavBar: false,
                      );
                    },
                    leading: const CircleAvatar(),
                    title: const Text('Coinbase'),
                    subtitle:  Text(TextConstant.testingTheCoinbase.tr()),
                    trailing: Text(
                      dateFormattedWithSlash(DateTime.now()),
                      style: context.textTheme.bodySmall,
                      textScaleFactor: 0.8,
                    ),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                  ),

//FOR THE ECHO WEBSOCKET
                  ListTile(
                    onTap: () {
                      navBarPush(
                        context: context,
                        screen: const ChatIfElseScreen(),
                        withNavBar: false,
                      );
                    },
                    leading: const CircleAvatar(),
                    title: const Text('ifElse.io'),
                    subtitle: const Text('Testing the coinbase websocket here'),
                    trailing: Text(
                      dateFormattedWithSlash(DateTime.now()),
                      style: context.textTheme.bodySmall,
                      textScaleFactor: 0.8,
                    ),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                  ),
                ].columnInPadding(5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
