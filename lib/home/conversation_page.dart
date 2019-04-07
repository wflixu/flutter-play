import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, AppStyle, Constants;
import '../model/conversation.dart' show Conversation, mockConversations;

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _ConversationItem (conversation: mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}

class _ConversationItem extends StatelessWidget {
  _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);

  final Conversation conversation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(AppColors.conversationItemBg),
          border: Border(
              bottom: BorderSide(
            color: Color(AppColors.dividerColor),
            width: Constants.dividerWidth,
          ))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Image.network('https://randomuser.me/api/portraits/women/10.jpg'),
          Image.network(
            conversation.avatar ,
            width: Constants.conversationAvatarSize,
            height: Constants.conversationAvatarSize,
          ),
          Container(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(conversation.title, style: AppStyle.TitleStyle),
                Text(
                  conversation.des,
                  style: AppStyle.DesStyle,
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[Text(conversation.createAt, style: AppStyle.DesStyle)],
          )
        ],
      ),
    );
  }
}
