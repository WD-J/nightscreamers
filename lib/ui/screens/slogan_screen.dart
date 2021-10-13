import 'package:flutter/material.dart';
import 'package:nightscreamers/ui/screens/white_screen.dart';
import 'package:nightscreamers/ui/widgets/word_list_widget.dart';

class SloganScreen extends StatefulWidget {
  static const String id = '/';

  @override
  State<StatefulWidget> createState() {
    return _SloganScreenState();
  }
}

class _SloganScreenState extends State<SloganScreen>
    with TickerProviderStateMixin {
  List<String> comeList = 'COME'.split('');
  List<String> screamList = 'SCREAM'.split('');
  List<String> withList = 'WITH'.split('');
  List<String> usList = 'US'.split('');

  bool comeClicked = false;
  bool screamClicked = false;
  bool withClicked = false;
  bool usClicked = false;

  void checkIfAllClicked() {
    // TODO: implement period onClick
    if (comeClicked && screamClicked && withClicked && usClicked) ;
  }

  Future<void> transitionToWhite() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => WhiteScreen(),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.25,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AbsorbPointer(
                      absorbing: comeClicked,
                      child: WordListWidget(
                          wordList: comeList,
                          switchClicked: () {
                            setState(() => comeClicked = true);
                            checkIfAllClicked();
                          }),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    AbsorbPointer(
                      absorbing: screamClicked,
                      child: WordListWidget(
                        wordList: screamList,
                        switchClicked: () {
                          setState(() => screamClicked = true);
                          checkIfAllClicked();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.25,
              ),
              SizedBox(height: 50.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AbsorbPointer(
                      absorbing: withClicked,
                      child: WordListWidget(
                        wordList: withList,
                        switchClicked: () {
                          setState(() => withClicked = true);
                          checkIfAllClicked();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    AbsorbPointer(
                      absorbing: usClicked,
                      child: WordListWidget(
                        wordList: usList,
                        switchClicked: () {
                          setState(() => usClicked = true);
                          checkIfAllClicked();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: Text(
                        '.',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontFamily: 'Nightscreamers',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
