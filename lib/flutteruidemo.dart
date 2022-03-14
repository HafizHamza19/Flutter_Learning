import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiDemo extends StatelessWidget {
  const UiDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*    return Container(

        decoration: const BoxDecoration(color: Colors.white),
        child: const Center(
          child: Text("Hello world!",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 32, color: Colors.indigo)),
        ),);*/

    var image = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/pic1.jpg'),
        Image.asset('images/pic2.jpg'),
        Image.asset('images/pic3.jpg')
      ],

    );
    /* return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: new Image.asset('images/pic1.jpg')
        ),
        Expanded(child: new Image.asset('images/pic2.jpg')),
        Expanded(child: new Image.asset('images/pic3.jpg'))
      ],
    );*/

/*    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('images/pic1.jpg'),
        Image.asset('images/pic2.jpg'),
        Image.asset('images/pic3.jpg')
      ],
    );*/
    /*return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset('images/pic1.jpg'),
        ),
        Expanded(
          flex: 4,
          child: Image.asset('images/pic2.jpg'),
        ),
        Expanded(
          child: Image.asset('images/pic3.jpg'),
        ),
      ],
    );*/

    Widget imagerow = Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Expanded(
          child: Image.asset('images/pic1.jpg'),
        ),
        Expanded(
          child: Image.asset('images/pic2.jpg'),
        ),
        Expanded(
          child: Image.asset('images/pic3.jpg'),
        ),

      ],
    );
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.indigo[500]),
        Icon(Icons.star, color: Colors.indigo[500]),
        Icon(Icons.star, color: Colors.indigo[500]),
        const Icon(Icons.star_border, color: Colors.black),
        const Icon(Icons.star_border, color: Colors.black)
      ],
    );

    var textstyle = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto',
        fontSize: 18);

    var container1 = Column(
      children: [
        Icon(Icons.image),
        Text("Images", style: textstyle),
        Text("25 count", style: textstyle)
      ],
    );
    var container2 = Column(
      children: [
        Icon(Icons.favorite),
        Text("Likes", style: textstyle),
        Text("25", style: textstyle)
      ],
    );
    Widget container3 = Column(
      children: [
        Icon(Icons.accessibility),
        Text("---", style: textstyle),
        Text("---", style: textstyle)
      ],
    );

    Widget row1 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        container1,
        container2,
        container3]
    );


    var description = Text(
      "The outlined section is implemented as two rows. The ratings row contains five stars and the number of reviews. The icons row contains three columns of icons and text.",
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: 'Roboto',
          fontSize: 18),
    );


    Widget _buildImageColumn(){
      return Container(
        decoration: const BoxDecoration(
          color: Colors.black
        ),
        child: Column(

        ),
      );
    }

    final rattings = Container(

      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            description,
            row1,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              stars,
              const Text(
                "170 reviews",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 20),
              ),
            ],
          )
          ],
        ),
      ),
    );
    return rattings;
  }
}
