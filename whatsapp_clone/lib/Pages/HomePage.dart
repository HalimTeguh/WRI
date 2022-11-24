import "package:flutter/material.dart";
import 'package:whatsapp_clone/Widgets/CallsWidget.dart';
import 'package:whatsapp_clone/Widgets/ChatsWidget.dart';

import '../Widgets/StatusWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              elevation: 0,
              title: const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "NaniApp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  )),
              actions: [
                const Padding(
                    padding: EdgeInsets.only(top: 12, right: 15),
                    child: Icon(
                      Icons.search,
                      size: 28,
                    )),
                PopupMenuButton(
                    onSelected: (selected) {
                      if (selected == 5) {
                        Navigator.pushNamed(context, "settingsPage");
                      }
                    },
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    iconSize: 28,
                    elevation: 10,
                    itemBuilder: (context) => [
                          const PopupMenuItem(
                              value: 1,
                              child: Text(
                                "New Group",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              )),
                          const PopupMenuItem(
                              value: 2,
                              child: Text(
                                "New Broadcast",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              )),
                          const PopupMenuItem(
                              value: 3,
                              child: Text(
                                "Linked Device",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              )),
                          const PopupMenuItem(
                              value: 4,
                              child: Text(
                                "Starred Messages",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              )),
                          const PopupMenuItem(
                              value: 5,
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ))
                        ]),
              ],
            )),
        body: Column(
          children: [
            Container(
              color: const Color(0xff005C4B),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                tabs: [
                  //tabs 1
                  const SizedBox(
                    width: 25,
                    child: Tab(
                      icon: Icon(Icons.camera_alt),
                    ),
                  ),
                  //tabs 2
                  Container(
                    width: 115,
                    padding: const EdgeInsets.only(left: 25),
                    child: Tab(
                      child: Row(
                        children: [
                          const Text("CHATS"),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "10",
                              style: TextStyle(
                                  color: Color(0xff075E55), fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //tabs 3
                  const SizedBox(
                    width: 115,
                    child: Tab(
                      child: Text("STATUS"),
                    ),
                  ),
                  const SizedBox(
                    width: 118,
                    child: Tab(
                      child: Text("CALLS"),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: TabBarView(
                  children: [
                    //tabs 1
                    Container(
                      color: Colors.black,
                    ),
                    //tabs 2
                    const ChatsWidget(),
                    //tabs 3 statusWidget
                    const StatusWidget(),
                    //tabs 4 CallsWidget
                    const CallsWidget(),
                  ],
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff075e55),
          child: const Icon(Icons.message),
        ),
      ),
    );
  }
}
