import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool _isWriting = false;

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();

    setState(() {
      _isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/a/ACg8ocIa2qNWirbSGDS9jvkLvufhQ2pT46e0Dsq9DAKb8gWErA=s288-c-no"),
                child: Text("Singing"),
              ),
              Positioned(
                bottom: 0,
                right: 2,
                child: Container(
                  width: Sizes.size14,
                  height: Sizes.size14,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              )
            ],
          ),
          title: const Text(
            "Singing",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text("Active now"),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _onStopWriting,
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Sizes.size14),
                      decoration: BoxDecoration(
                        color: isMine ? Colors.blue : Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(Sizes.size20),
                          topRight: const Radius.circular(Sizes.size20),
                          bottomLeft: isMine
                              ? const Radius.circular(Sizes.size20)
                              : Radius.zero,
                          bottomRight: !isMine
                              ? const Radius.circular(Sizes.size20)
                              : Radius.zero,
                        ),
                      ),
                      child: const Text(
                        "this is a message!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 14,
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size14,
                  vertical: Sizes.size10,
                ),
                color: Colors.grey.shade50,
                child: SizedBox(
                  height: Sizes.size44,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onTap: _onStartWriting,
                          decoration: InputDecoration(
                              hintText: "Send a message ...",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size12,
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.faceSmile,
                                    color: Colors.black,
                                  ),
                                  Gaps.h14,
                                  if (_isWriting)
                                    GestureDetector(
                                      onTap: _onStopWriting,
                                      child: FaIcon(
                                        FontAwesomeIcons.circleArrowUp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                ],
                              )),
                        ),
                      ),
                      Gaps.h20,
                      Container(
                        width: Sizes.size36,
                        height: Sizes.size36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size28),
                          color: Colors.grey.shade300,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: Sizes.size20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
