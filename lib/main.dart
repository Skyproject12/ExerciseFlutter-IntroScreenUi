import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'attr.dart';
import 'dart:async';

import 'package:intro_screen/attr.dart';

void main() => runApp(new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      title: 'Application Intro',
      // make activity default
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            autoPlay: false,
            enableInfiniteScroll: false,
            initialPage: 0,
            reverse: false,
            viewportFraction: 1.0,
            aspectRatio: MediaQuery.of(context).size.aspectRatio,
            height: MediaQuery.of(context).size.height - 30,
            // change the size item for slidder
            items: [0, 1, 2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      child: AppIntro(i));
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// defination item
class AppIntro extends StatefulWidget {
  int index;

  // make constructor in index appIntro and take data from contentpage
  AppIntro(this.index);

  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // call the data
    print(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          // memberi tumpukan pada suatu layout
          child: Stack(
            children: <Widget>[
              // position dimana suatu data tidak dapat keluar dari layout parent
              Positioned(
                top: 10,
                left: 24,
                child: Text(
                  'Numero\u00B9',
                  style: TextStyle(
                      fontFamily: "AvenirBold",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // ketika index dua maka tampilkan done dan skip
              Positioned(
                right: 24,
                top: 12,
                child: new Text(
                  widget.index == 2 ? "DONE" : "SKIP",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      //set fontfamily
                      fontFamily: "SultanNahia"),
                ),
              )
            ],
          ),
        ),
        // add more text
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 10),
          // mengatur height dari android content
          height: MediaQuery.of(context).size.height -168,
          child: Column(
            children: <Widget>[
              Image.asset(
                imagePath[widget.index],
                width: 280.0,
                height: 280.0,
                fit: BoxFit.fitWidth,
              ),
              // make title in page intro
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Center(
                  child: new Text(
                    title[widget.index],
                    style: TextStyle(fontFamily: "Caslon", fontSize: 20.0),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 15),
                // make padding horizontal in flutter
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: new RichText(
                    // membuat text ditengah
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                        style:
                            new TextStyle(fontSize: 12.0, color: Colors.black),
                        // custom of description
                        children: <TextSpan>[
                          new TextSpan(
                              text: description[widget.index],
                              style: new TextStyle(
                                  fontFamily: 'Avenir',
                                  color: Colors.blueGrey,
                                  height: 1.8,
                                  letterSpacing: 1.0)),
                          new TextSpan(
                              text: widget.index == 0 ? ' Numero1 ' : '',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'AvenirBoild'))
                        ])),
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 50.0),
          // mengatur height dari scroll right
          height: 72,
          child: Stack(
            // make list for display point
            children: <Widget>[
              // membuat lingkaran lingkarang kecil
              DotsIndicators(widget.index),
              Center(
                child: new Text(widget.index != 2 ? 'SCROLL RIGHT' : '',
                    style: TextStyle(fontFamily: "Avenir", fontSize: 10.0)),
              ),
              Positioned(
                  top: widget.index != 2 ? 36 : 0,
                  right: 0,
                  // ketika index intro tidak sama dengan dua
                  child: widget.index != 2
                      ? Image.asset(
                          'assets/images/arrow.png',
                          width: 30.0,
                        )
                      : LetGo())
            ],
          ),
        )
      ],
    );
  }
}

class DotsIndicators extends StatefulWidget {
  int pageIndex;

  DotsIndicators(this.pageIndex);

  @override
  _DotsIndicatorsState createState() => _DotsIndicatorsState();
}

class _DotsIndicatorsState extends State<DotsIndicators> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // make list have horizontal scroll
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              // make black border
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle,
              // membuat suatu border decoration can corresponding  pageIndex
              color: index == widget.pageIndex ? Colors.black : Colors.white),
        );
      },
    );
  }
}

class LetGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      // membuat button di akhir screen
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            left: 28,
            child: Text(
              "LET GO",
              style: TextStyle(color: Colors.white, fontFamily: 'AvenirBold'),
            ),
          )
        ],
      ),
    );
  }
}
