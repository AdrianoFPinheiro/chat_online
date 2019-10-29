import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  // Teste do Firebase DataBase
  // Firestore.instance.collection("testeColection1").document("testeDocument1").setData({"testeData1": "teste"});

  runApp(MyApp());
}

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      debugShowCheckedModeBanner: false,
      theme: Theme
          .of(context)
          .platform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Chat App"),
            centerTitle: true,
            elevation:
            Theme
                .of(context)
                .platform == TargetPlatform.iOS ? 0.0 : 4.0,
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                  child: ListView(
                    children: <Widget>[
                      ChatMessage(),
                      ChatMessage(),
                      ChatMessage()
                    ],
                  ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .cardColor,
                ),
                child: TextComposer(),
              )
            ],
          )),
    );
  }
}

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme
          .of(context)
          .accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: Theme
            .of(context)
            .platform == TargetPlatform.iOS
            ? BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[200])))
            : null,
        child: Row(
          children: <Widget>[
            Container(
              child:
              IconButton(icon: Icon(Icons.photo_camera), onPressed: () {}),
            ),
            Expanded(
              child: TextField(
                decoration:
                InputDecoration.collapsed(hintText: "Enviar uma mensagem"),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
              ),
            ),
            Divider(
              height: 2.0,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme
                    .of(context)
                    .platform == TargetPlatform.iOS
                    ? CupertinoButton(
                  child: Text("Enviar"),
                  onPressed: _isComposing ? () {} : null,
                )
                    : IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _isComposing ? () {} : null,
                ))
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://s2.glbimg.com/Zuz5QTdCesKk42uMjtJYzKwhQJA=/0x0:3240x2160/1600x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2019/X/1/6KAgaSQaeJ4NPq2XLzUQ/birdseclipse-caldas-3240.jpg"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Adriano",
                    style: Theme
                        .of(context)
                        .textTheme
                        .subhead),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text("Teste"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


