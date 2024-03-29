import 'package:flutter/material.dart';
import 'package:lahaus_brokers1/model/slide_model.dart';
import 'package:lahaus_brokers1/widgets/slide_dots.dart';
import 'package:lahaus_brokers1/widgets/slide_item.dart';

class IntroSlide extends StatefulWidget {
  // IntroSlide({Key key}) : super(key: key);

  @override
  _IntroSlideState createState() => _IntroSlideState();
}

class _IntroSlideState extends State<IntroSlide> {
  int _currentpage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemBuilder: (context, i) => SlideItem(i),
                      itemCount: slidelist.length,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (int i = 0; i < slidelist.length; i++)
                                if (i == _currentpage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlatButton(
                    textColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, 'phototour'),
                    child: Text(
                      '¿Eres nuevo?',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(15),
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(30)),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.all(15),
                        color: Colors.white,
                        textColor: Colors.black,
                        onPressed: () {
                          // Navigator();
                        },
                        child: Text('¿Ya nos conocemos?',
                            style: TextStyle(fontSize: 18.0))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
