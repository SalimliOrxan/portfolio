import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemApp extends HookWidget {

  final String name;
  final String description;
  final String urlImg;
  final List<Color> backgroundColors;

  ItemApp({@required this.name, @required this.description, @required this.urlImg, @required this.backgroundColors});

  final _providerButton = StateProvider((_) => Colors.white);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return Container(
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(gradient: LinearGradient(colors: backgroundColors)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: constraints.maxWidth * 0.1, top: 200),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              name,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)
                              )
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 30),
                            width: constraints.maxWidth * 0.3,
                            child: Text(
                                description,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 16, color: Colors.white)
                                )
                            ),
                          ),
                          MouseRegion(
                            onEnter: (_) => context.read(_providerButton).state = Colors.black87,
                            onExit: (_) => context.read(_providerButton).state = Colors.white,
                            child: Container(
                              height: 45,
                              width: 200,
                              child: TextButton(
                                  onPressed: (){

                                  },
                                  child: Text(
                                      'SEE THE PROJECT',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 16, color: backgroundColors[0], fontWeight: FontWeight.bold)
                                      )
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateColor.resolveWith((_) => context.read(_providerButton).state)
                                  )
                              )
                            ),
                          )
                        ]
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.only(top: 50, right: constraints.maxWidth * 0.03, bottom: 50),
                          child: FadeInUp(child: Image.network(urlImg))
                      )
                  )
                ]
            )
        );
      }
    );
  }
}