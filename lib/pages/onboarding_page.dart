import 'package:fittness_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final listPagesViewModel = [

    PageViewModel(
      title: "No pain, no gain",
      body: "Exige al maximo a tu cuerpo para obtener los mejores resultados en menor tiempo...",
      image: Center(
        child: Container(
          width: 250,
          height: 250,
          child: SvgPicture.asset( 'assets/img1.svg' ),
        )
      ),
      decoration: const PageDecoration(
        fullScreen: false,
        pageColor: Color(0xFF1a237e),
        titleTextStyle: TextStyle( color: Colors.white, fontSize: 20),
        bodyTextStyle: TextStyle( color: Colors.white, fontSize: 16 )
      )
    ),

    PageViewModel(
      title: "Supera tus limites",
      body: "El dolor es temporal, la satisfaccion es para siempre...",
      image: Center(
        child: Container(
          width: 250,
          height: 250,
          child: SvgPicture.asset( 'assets/img2.svg' ),
        )
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF1a237e),
        titleTextStyle: TextStyle( color: Colors.white, fontSize: 20),
        bodyTextStyle: TextStyle( color: Colors.white, fontSize: 16 )
      )
    ),

    PageViewModel(
      title: "Rompe los limites de resistencia",
      body: "En cada ejercicio se muestra un cronometro que tu nivelas para superar la exigencia de ti mismo...",
      image: Center(
        child: Container(
          width: 250,
          height: 250,
          child: SvgPicture.asset( 'assets/img3.svg' ),
        )
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF1a237e),
        titleTextStyle: TextStyle( color: Colors.white, fontSize: 20),
        bodyTextStyle: TextStyle( color: Colors.white, fontSize: 16 )
      )
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: Color(0xFF1a237e),
      //   title: Text( 'Fitness App' ),
      // ),

      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: ( context ) => HomePage() 
            )
          );
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        globalBackgroundColor: Color(0xFF1a237e),
        showSkipButton: false,
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.arrow_right),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        skipColor: Colors.white,
        doneColor: Colors.white,
        nextColor: Colors.white,
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.white,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),
        ),
      )



    );
  }
}