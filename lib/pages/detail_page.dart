import 'dart:io';

import 'package:contact_diary_app/Globals.dart';
import 'package:contact_diary_app/theme/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class detail_page extends StatefulWidget {
  const detail_page({Key? key}) : super(key: key);

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
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
              setState(() {});
            },
          ),
        ],
        // backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 5,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      (res.image != null) ? FileImage(res.image as File) : null,
                  backgroundColor: Colors.grey,
                ),
                const Spacer(
                  flex: 1,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Global.allContacts.remove(res);

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'Contact_page', (route) => false);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('Edit_Contact_page', arguments: res);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${res.firstName} ${res.lastName}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "+91 ${res.phoneNumber}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () async {
                    Uri url = Uri.parse("tel:+91${res.phoneNumber}");

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Can not be launched.."),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: const Icon(Icons.call),
                  mini: true,
                  backgroundColor: Colors.green,
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () async {
                    Uri url = Uri.parse("sms:+91${res.phoneNumber}");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Can not be launched.."),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: const Icon(Icons.message),
                  mini: true,
                  backgroundColor: Colors.amber,
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () async {
                    Uri url = Uri.parse(
                        "mailto:${res.email}?subject=Demo&body=Hello");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Can not be launched.."),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: const Icon(Icons.email),
                  mini: true,
                  backgroundColor: Colors.lightBlue,
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () async {
                    await Share.share(
                        "+91 ${res.phoneNumber} \n${res.firstName}  \n${res.lastName}  ");
                  },
                  child: const Icon(Icons.share),
                  mini: true,
                  backgroundColor: Colors.deepOrangeAccent,
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
