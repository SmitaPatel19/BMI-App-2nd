import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var hgtCon = TextEditingController();
  var wgtCon = TextEditingController();
  var result = "";
  Decoration bgcolor = BoxDecoration(
  gradient: RadialGradient(
  colors: [

    Colors.purple.shade100,
    Colors.purple.shade200,
    Colors.purple.shade300,
    Colors.purple.shade400,
  ],
    center: Alignment.center
  ),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(child: Text('BMI App',style: TextStyle(fontWeight: FontWeight.bold),),),
      ),
      body: Center(
        child: Container(

          decoration: bgcolor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('BMI',style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),),

                  SizedBox(height: 15,),

                  TextField(

                    controller: hgtCon,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(

                      label: Text('Enter Height in cm'),
                      prefixIcon: Icon(Icons.height_outlined),
                      prefixIconColor: Colors.deepPurple,

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        )
                      )
                    ),
                  ),

                  SizedBox(height: 12,),

                  TextField(

                    controller: wgtCon,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(

                        label: Text('Enter Weight in kg'),
                      prefixIcon: Icon(Icons.line_weight_outlined),
                      prefixIconColor: Colors.deepPurple,

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        )
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        )
                      )
                    ),
                  ),

                  SizedBox(height: 12,),

                  ElevatedButton(onPressed: (){

                    var Wgt = wgtCon.text.toString();
                    var Hgt = hgtCon.text.toString();

                    if(Wgt!="" && Hgt!= ""){

                      var iWgt = int.parse(Wgt);
                      var iHgt = int.parse(Hgt);
                      var mHgt = iHgt/100;
                      var bmi= iWgt/(mHgt*mHgt);
                      var msg="";

                      if(bmi<18){
                          msg = "You'r Underweight";
                          //bgcolor = Colors.red.shade50;

                        bgcolor = BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.red.shade50,
                              Colors.red.shade300,
                              Colors.red.shade600,
                              Colors.red.shade900
                            ]
                          )
                        );

                      }else if(bmi > 25){
                          msg = "You'r Overweight";
                          //bgcolor = Colors.red.shade50;

                          bgcolor = BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.red.shade50,
                                    Colors.red.shade300,
                                    Colors.red.shade600,
                                    Colors.red.shade900
                                  ]
                              )
                          );

                      }else{
                          msg = "You'r Healthy";
                          //bgcolor = Colors.purple.shade50;

                          bgcolor = BoxDecoration(
                            gradient: LinearGradient(
                                colors: [

                                  Colors.purple.shade100,
                                  Colors.purple.shade200,
                                  Colors.purple.shade300,
                                  Colors.purple.shade400,
                                ],
                            ),
                          );

                    }
                      setState(() {
                        result = "$msg\nYour BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    }
                    else{
                      setState(() {
                        result = 'Please fill all the details';
                      });
                    }

                  }, child: Text("Calculate",style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple
                  ),)
                  ),

                  SizedBox(height: 15,),

                  Text(result,style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.deepPurple
                  ),),
                ],
              ),

        ),
      )


    );
  }
}
