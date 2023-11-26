import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChtasScreen extends StatefulWidget {
  const ChtasScreen({super.key});

  @override
  State<ChtasScreen> createState() => _ChtasScreenState();
}

class _ChtasScreenState extends State<ChtasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Direct messages"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              foregroundImage: NetworkImage(
                  "https://lh3.googleusercontent.com/a/ACg8ocIa2qNWirbSGDS9jvkLvufhQ2pT46e0Dsq9DAKb8gWErA=s96-c-rg-br100"),
              child: Text("Singing"),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Maroon5",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "2:16 PM",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: Sizes.size12,
                  ),
                )
              ],
            ),
            subtitle: const Text("Don't forget to make videos"),
          )
        ],
      ),
    );
  }
}
