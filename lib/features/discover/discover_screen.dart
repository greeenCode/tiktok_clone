import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  bool _isTextFieldNotEmpty = false;

  void _onSearchChanged(value) {
    print("Search for $value");
    setState(() {
      _isTextFieldNotEmpty = _textEditingController.text.isNotEmpty;
    });
  }

  void _onSearchSubmitted(value) {
    print("Submitted $value");
  }

  void _unFocus() {
    FocusScope.of(context).unfocus();
  }

  void _onTextFieldXmarkPressed() {
    _textEditingController.clear();
    setState(() {
      _isTextFieldNotEmpty = _textEditingController.text.isNotEmpty;
    });
  }

  void _onTextFieldArrowUpPressed() {
    FocusScope.of(context).unfocus();
    _onTextFieldXmarkPressed();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: SizedBox(
            height: Sizes.size44,
            child: TextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
              decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size4,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.size12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size12,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ],
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_isTextFieldNotEmpty)
                          GestureDetector(
                            onTap: _onTextFieldXmarkPressed,
                            child: FaIcon(
                              FontAwesomeIcons.circleXmark,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        Gaps.h14,
                        if (_isTextFieldNotEmpty)
                          GestureDetector(
                            onTap: _onTextFieldArrowUpPressed,
                            child: FaIcon(
                              FontAwesomeIcons.circleArrowUp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                      ],
                    ),
                  )),
            ),
          ),
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            splashFactory: NoSplash.splashFactory,
            indicatorColor: Colors.black,
            labelStyle: const TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: GestureDetector(
          onTap: _unFocus,
          child: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(Sizes.size6),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 20,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size4),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/placeholder.jpg",
                          image:
                              "https://images.unsplash.com/photo-1615809265087-1416ccddd6ab?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                      ),
                    ),
                    Gaps.v8,
                    const Text(
                      "This is a very long caption for my tiktok that im upload just now currently.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v8,
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              "https://lh3.googleusercontent.com/a/ACg8ocIa2qNWirbSGDS9jvkLvufhQ2pT46e0Dsq9DAKb8gWErA=s96-c-rg-br100",
                            ),
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              "My avatar is going to be very long",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                          const Text(
                            "2.5M",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(
                      fontSize: Sizes.size36,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
