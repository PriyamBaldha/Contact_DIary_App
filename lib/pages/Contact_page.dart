import 'dart:io';
import 'package:contact_diary_app/Globals.dart';
import 'package:flutter/material.dart';

import '../theme/App_theme.dart';

class Contact_page extends StatefulWidget {
  const Contact_page({Key? key}) : super(key: key);

  @override
  State<Contact_page> createState() => _Contact_pageState();
}

class _Contact_pageState extends State<Contact_page> {
  bool color = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('Add_page');
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(
              fontSize: 25,
              color: (AppTheme.isDark) ? Colors.white : Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.circle,
                color: (AppTheme.isDark) ? Colors.white : Colors.black),
            onPressed: () {
              setState(() {
                AppTheme.isDark = !AppTheme.isDark;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.menu,
                color: (AppTheme.isDark) ? Colors.white : Colors.black),
            onPressed: () {
              setState(() {
                // AppTheme.isDark = !AppTheme.isDark;
              });
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
          alignment: Alignment.center,
          child: (Global.allContacts.isEmpty)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_box_outlined,
                      size: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "     You have no contacts yet",
                      style: TextStyle(
                        color: (AppTheme.isDark) ? Colors.grey : Colors.grey,
                        fontSize: 25,
                      ),
                    )
                  ],
                )
              : ListView.builder(
                  itemCount: Global.allContacts.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('detail_page',
                            arguments: Global.allContacts[i]);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: (Global.allContacts[i].image != null)
                              ? FileImage(Global.allContacts[i].image as File)
                              : null,
                        ),
                        title: Text(
                            "${Global.allContacts[i].firstName} ${Global.allContacts[i].lastName}"),
                        subtitle:
                            Text("+91 ${Global.allContacts[i].phoneNumber}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    );
                  })),
    );
  }
}
