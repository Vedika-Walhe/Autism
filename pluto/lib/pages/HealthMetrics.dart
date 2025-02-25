import 'package:flutter/material.dart';

class HealthMetrics extends StatefulWidget{
  const HealthMetrics({super.key});

  @override
  _HealthMetricsState createState() => _HealthMetricsState();
}

class _HealthMetricsState extends State<HealthMetrics> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F5F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              
            }, 
            icon: Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF242E49))
        ),
        title: Text(
          'Smart Health Metrics',
          style: TextStyle(
            color: Color(0xFF242E49),
            fontSize: 24,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold
          )
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              Container(
                // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: 310,
                height: 135,
                decoration: BoxDecoration(
                  color: Color(0xFF60AFF9),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Image.asset("assets/bodyTemp.png",
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain),

                    SizedBox(width: 20),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Body Temperature",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFFFFFFFF)
                        )),
                        Row(
                          children: [
                            Text("97",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFFFFFFFF)
                              )),
                            SizedBox(width: 8),
                            Text("°F",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFFFFFFFF).withOpacity(0.8)
                              ))
                          ],
                        )
                      ],
                    )
                  ]
                )
              ),
              SizedBox(height: 30),
              Container(
                width: 310,
                height: 135,
                decoration: BoxDecoration(
                    color: Color(0xFFFC3A2E),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Padding(padding: EdgeInsets.all(10)),
                      Image.asset("assets/heartRate.png",
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain),

                      SizedBox(width: 25),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Heart Rate",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFFFFFFFF)
                              )),

                          Row(
                            children: [
                              Text("120",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFFFFFFFF)
                                )),
                              SizedBox(width: 8),
                              Text("bpm",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFFFFFFFF).withOpacity(0.8)
                                ))
                            ],
                          )
                        ],
                      )
                    ]
                )
              ),
              SizedBox(height: 30),
              Container(
                width: 310,
                height: 135,
                decoration: BoxDecoration(
                    color: Color(0xFF5CFF76),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Padding(padding: EdgeInsets.all(4)),
                      Image.asset("assets/skinConductance.png",
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain),

                      SizedBox(width: 5),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Skin Conductance",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFFFFFFFF)
                              )),

                          Row(
                            children: [
                              Text("15",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFFFFFFFF)
                                )),
                              SizedBox(width: 8),
                              Text("μS",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFFFFFFFF).withOpacity(0.8)
                                ))
                            ],
                          )
                        ],
                      )
                    ]
                )
              )

            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF242E49),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,

        onTap: (index){
          setState((){
            _selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_sharp),
            label: "Metrics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_sharp),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile"
          )
        ]
      ),
    );
  }
}
