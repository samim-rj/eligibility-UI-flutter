import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'eligibility_sceen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> subjectName = <String>["Chemistry","Physics","Mathematics"];
  final List<int> percentageText = <int>[60,60,60];
  final List<int> percentage = <int>[60,60,60];
  int eligiblePercentageCounter;
  int counter;



  @override
  void initState() {
    super.initState();
    eligiblePercentageCounter = 0;
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: Text('CHECK ELIGIBILITY',style: TextStyle(
          fontWeight: FontWeight.w900,
              letterSpacing: 0.8
        ),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height/1.3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(16.0),
                    itemCount: subjectName.length,
                    itemBuilder: (BuildContext context, int index) {
                      String subject = subjectName[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(height: 10.0,),
                          Text(subject.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),
                          SizedBox(height: 10.0,),
                          Container(
                              height: 30.0,
                              width: 30.0,
                              color: Colors.blueAccent,
                              child: Center(child: Text('${percentageText[index].toString()}',style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.w900),))),
                          Row(
                            children: [
                              Container(
                      height: 30.0,
                      width: 30.0,
                      color: Colors.blueAccent,
                      child: Center(child: Text('%',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),))),
                              Expanded(
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    thumbColor: Color(0xFFEB1555),
                                    overlayColor: Color(0x29EB1555),
                                    activeTrackColor: Color(0xFF8D8E98),
                                    inactiveTrackColor: Colors.white30,
                                    thumbShape:
                                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                    overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 30.0)
                                  ),
                                  child: Slider(
                                    value: percentageText[index].toDouble(),
                                    min: 0.0,
                                    max: 100.0,
                                    onChanged: (double newValue) {
                                      setState(() {
                                        percentageText[index]=newValue.round();
                                      });
                                    },
                                    onChangeEnd: (double endValue) {
                                      setState(() {
                                        percentage[index] = endValue.round();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      );
                    },
                  ),
                ),
            Container(
              height: 70.0,
              width: 150.0,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Text('CHECK',style: TextStyle(fontWeight: FontWeight.w900,letterSpacing: 5.0,fontSize: 25.0,color: Colors.white),),
                onPressed: () {
                        eligiblePercentageCounter = 0;
                        counter=0;
                        setState(() {
                          for (int i = 0; i < percentage.length; i++) {
                              eligiblePercentageCounter = eligiblePercentageCounter + percentage[i];
                              if(percentage[i] >= 60)
                                counter++;
                          }
                          print(eligiblePercentageCounter/3.round());
                          print(counter);
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EligibilityScreen(
                                    scorePercentage: (eligiblePercentageCounter/3).round(),
                                    subjectQualified: counter,
                                  )),
                        );
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}