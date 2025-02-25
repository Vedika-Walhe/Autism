import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F5F9),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Column(
            children: [
              SizedBox(height: 90),
              Image.asset("assets/pluto_logo2.png",
              width: 120,
              height: 120,
              fit: BoxFit.contain),
              Text("You're a",
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 45,
                fontWeight: FontWeight.w900 ,
                color: Color(0xFF242E49),
              )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/parents.png",
                  width:120,
                  height: 120,
                  fit: BoxFit.contain),

                  Container(
                    width: 2,
                    height: 210,
                    color: Color(0xFF242E49),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  ),

                  Image.asset("assets/therapist.png",
                      width:120,
                      height: 120,
                      fit: BoxFit.contain),
                ]
              ),
              SizedBox(height: 40),

              ElevatedButton(
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9EC8B9),
                    minimumSize: Size(270, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  child: Text("Parent",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Plus Jakarta Sans',
                    color: Color(0xFFFFFFFF)
                  ))
              ),

              SizedBox(height: 30),

              ElevatedButton(
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9EC8B9),
                      minimumSize: Size(270, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  child: Text("Therapist",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFFFFFFFF)
                      ))
              )
            ]
          )
        ]
      )
    );
  }
}
