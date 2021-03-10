import 'package:flutter/material.dart';
import 'package:portfolio/itemApp.dart';

class ProductPage extends StatefulWidget {

  @override
  _ProductState createState() => _ProductState();
}


class _ProductState extends State<ProductPage> {

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
    return Scrollbar(
        showTrackOnHover: true,
        child: SingleChildScrollView(
            child: LayoutBuilder(
                builder: (context, constraints){
                  _width  = constraints.maxWidth;
                  _height = constraints.maxHeight;

                  return ListView.builder(
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => items[index]
                  );
                }
            )
        )
    );
  }
}