import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final _providerButtonProjects = StateProvider((_) => Colors.white);
  final _providerButtonContact  = StateProvider((_) => false);
  final List<Color>_colors = [Color(0xFF286474), Color(0xFF286464), Color(0xFF286454)];
  double _width, _height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: _body()
    );
  }

  Widget _appBar(){
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace: Stack(
        alignment: Alignment.centerRight,
        children: [
          Positioned(
            right: 50,
            child: Row(
                children: [
                  Container(
                      height: 35,
                      width: 140,
                      child: TextButton(
                          onPressed: () => context.read(_providerButtonContact).state = !context.read(_providerButtonContact).state,
                          child: Text(
                              'CONTACT ME',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)
                              )
                          ),
                          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((_) => Color(0xFF253847)))
                      )
                  ),
                  Visibility(
                      visible: useProvider(_providerButtonContact).state ,
                      child: FadeInLeft(
                        child: Row(
                          children: [
                            InkWell(
                                onTap: (){

                                },
                                child: Container(width: 55, child: SvgPicture.asset('assets/images/facebook.svg', height: 30, width: 30))
                            ),
                            InkWell(
                                onTap: (){

                                },
                                child: Container(width: 55, child: SvgPicture.asset('assets/images/linkedin.svg', height: 30, width: 30))
                            ),
                            InkWell(
                                onTap: (){

                                },
                                child: Container(width: 55, child: SvgPicture.asset('assets/images/gmail.svg', height: 30, width: 30))
                            )
                          ]
                        ),
                      )
                  )
                ]
            ),
          ),
        ],
      )
    );
  }

  Widget _body(){
    return LayoutBuilder(
        builder: (context, constraints){
          _width  = constraints.maxWidth;
          _height = constraints.maxHeight;
          return _header();
        }
    );
  }

  Widget _header(){
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: _colors)
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              _button()
            ]
        )
    );
  }

  Widget _title(){
    return Padding(
        padding: EdgeInsets.only(left: _width * 0.1, top: 200),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                        'Mobile Developer',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold)
                        )
                    )
                ),
              ),
              Column(
                  children: [
                    FadeInUp(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset('assets/images/flutter.svg', width: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                  'Flutter android and ios development',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 16, color: Colors.white)
                                  )
                              ),
                            )
                          ]
                      ),
                    ),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset('assets/images/android.svg', width: 30),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                    'Native android development',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 16, color: Colors.white)
                                    )
                                ),
                              )
                            ]
                        ),
                      ),
                    )
                  ]
              )
            ]
        )
    );
  }

  Widget _button(){
    return Padding(
        padding: EdgeInsets.only(left: _width * 0.1, top: 70),
        child: MouseRegion(
          onEnter: (_) => context.read(_providerButtonProjects).state = Color(0xFF253847),
          onExit: (_) => context.read(_providerButtonProjects).state = Colors.white,
          child: FadeInUp(
            child: Container(
                height: 45,
                width: 200,
                child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, 'product'),
                    child: Text(
                        'SEE PROJECTS',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 16, color: _colors[0], fontWeight: FontWeight.bold)
                        )
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((_) => context.read(_providerButtonProjects).state)
                    )
                )
            ),
          ),
        )
    );
  }


  void showContacts() async {
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(_width - 190, 60, 50, 0),
        color: Colors.transparent,
        elevation: 0,
        items: <PopupMenuEntry<String>>[
          PopupMenuItem(
              height: 50,
              value: 'fb',
              child: Center(child: SvgPicture.asset('assets/images/facebook.svg', height: 30, width: 30))
          ),
          PopupMenuItem(
              height: 50,
              value: 'ln',
              child: Center(child: SvgPicture.asset('assets/images/linkedin.svg', height: 30, width: 30, color: Colors.blue))
          ),
          PopupMenuItem(
              height: 50,
              value: 'gm',
              child: Center(child: SvgPicture.asset('assets/images/gmail.svg', height: 30, width: 30))
          )
        ]
    );
  }
}