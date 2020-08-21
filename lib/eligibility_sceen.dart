import 'package:flutter/material.dart';

class EligibilityScreen extends StatefulWidget {
  EligibilityScreen({this.scorePercentage,this.subjectQualified});
  final scorePercentage;
  final subjectQualified;
  @override
  _EligibilityScreenState createState() => _EligibilityScreenState();
}

class _EligibilityScreenState extends State<EligibilityScreen> {
  int scorePercentage,subjectQualified;
  @override
  void initState() {
    scorePercentage = widget.scorePercentage;
    subjectQualified = widget.subjectQualified;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eligibility'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(height: 60.0,),
              FlutterLogo(colors: (subjectQualified == 3)?Colors.green:Colors.red,
                size: 100,),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Text((subjectQualified == 3)?'Good!!!':(subjectQualified == 2)?'You have not secured 60 percentile in one subject':
                  (subjectQualified == 1)?'You have not secured 60 percentile in two subjects':'You have not secured 60 percentile in three subjects',
                  style: TextStyle(
                    color: (subjectQualified == 3)?Colors.green:Colors.red,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                  ),),
                ),
              ),
              SizedBox(height: 30.0,),
              Text((subjectQualified == 3)?'Eligible For:':'Not Eligible For:',style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25.0
              ),),
              SizedBox(height: 20.0,),
              Text("4-year B.Tech. in Civil Engineering",style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.blue,
                  fontSize: 18.0
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
