import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/itemApp.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  double _width, _height;
  List<ItemApp>items;

  @override
  void initState() {
    super.initState();

    items = [
      ItemApp(
          name: 'SMART DRAFT',
          description: 'DraftKings, a cross platform experience for NFL Daily Fantasy Sports, is the smartest and fastest way to draft. Users join contests and develop a team according to players’ salary valuations, which stem from historical accomplishments. Player data and ratings are aggregated in order to facilitate a seamless crafting process for your successful Daily Fantasy Sports roster. You have the ability to see how each player affects the team, but also be strategic in how you draft with the constraint of a 50,000 salary cap for a cash or tournament experience.',
          urlImg: 'https://lithiosapps.com/wp-content/uploads/2019/01/draft-kings-mockup.png',
          backgroundColors: [Color(0xFF80bc00), Color(0xFF9ae102)]
      ),
      ItemApp(
          name: 'CADIANT TOUCHSCREEN CONTROLS',
          description: 'description',
          urlImg: 'https://lithiosapps.com/wp-content/uploads/2019/04/cree-mockup.png',
          backgroundColors: [Color(0xFF005596), Color(0xFF0081e3)]
      ),
      ItemApp(
          name: 'BAYER MEMOOD APP',
          description: 'description',
          urlImg: 'https://lithiosapps.com/wp-content/uploads/2019/01/bayer-mockup.png',
          backgroundColors: [Color(0xFF0090c3), Color(0xFF00bcff)]
      ),
      ItemApp(
          name: 'INTEL DRONE PLATFORM',
          description: 'description',
          urlImg: 'https://lithiosapps.com/wp-content/uploads/2019/01/intel-mockup.png',
          backgroundColors: [Color(0xFF02aaa9), Color(0xFF04d6d4)]
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body()
    );
  }

  Widget _body(){
    return LayoutBuilder(
      builder: (context, constraints){
        _width  = constraints.maxWidth;
        _height = constraints.maxHeight;

        return Scrollbar(
          showTrackOnHover: true,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _header(),
                _title2(),
                for(ItemApp item in items) item,
                _footer()
              ]
            )
          )
        );
      }
    );
  }

  Widget _header(){
    return Container(
      height: 600,
      width: double.infinity,
      color: Color(0xFF253847),
      child: _title()
    );
  }

  Widget _title(){
    return Padding(
        padding: EdgeInsets.only(left: _width * 0.1, top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                  'My Portfolio',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold)
                  )
              ),
            ),
            Container(
              width: _width * 0.4,
              child: Text(
                  'A collection of diverse projects demonstrating the creativity, spectrum, and intuitiveness of our work with both large brands like DraftKings and local startups like Operation36 Golf.',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 16, color: Colors.white)
                  )
              ),
            )
          ]
        )
    );
  }

  Widget _title2(){
    return Container(
          color: Colors.white,
          height: 250,
          width: double.infinity,
          child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                        'We Take Pride in Our Work',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold)
                        )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.25),
                    child: Text(
                        'Every business has unique problems that can be fixed with the right software solution. At Lithios we believe that software should be intuitive, simple, and should solve these business problems. We strive to build the best possible solutions to our clients problems. Below are a few product solutions we have developed for startups and Fortune 500 companies.',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)
                        ),
                        textAlign: TextAlign.center
                    )
                  )
                ]
              )
          )
      );
  }

  Widget _footer(){
    return Container(
        height: 200,
        width: double.infinity,
        color: Colors.black
    );
  }
}