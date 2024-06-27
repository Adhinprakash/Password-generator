import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';



class ScreenHome extends StatefulWidget  {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome>  {
   final Set<PasswordOption> selectedOptions = {};
    final _controller=TextEditingController();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
 
double _volumeValue = 20; 

void onVolumeChanged(double value) {
  setState(() {
    _volumeValue = value;
  });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 78, 75),
       
        body: Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 0),
          child: Container(
            child:  Column(
           
              children: [
                 const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Text(
                          
                          "Create",
                          maxLines: 1,
                          style: TextStyle(fontSize: 65, fontWeight: FontWeight.w500,),
                ),  
                SizedBox(width: 9,),
                 Text(
                          
                          "a solid",
                          maxLines: 1,
                          style: TextStyle(fontSize: 65, fontWeight: FontWeight.w500,color: Color.fromARGB(87, 49, 48, 48)),
                )

                       ],
                     ),Text(
                      "Password",
                      maxLines: 1,
                      style: TextStyle(fontSize:60 , fontWeight: FontWeight.w500,color: Color.fromARGB(87, 49, 48, 48)),
                ),
                   ],
                 ),
                const SizedBox(
                  height: 40,
                ),


                 Center(
           
                  child:  
 
 SizedBox(
  height: 290,
  width: 290,
   child: CircleAvatar(
    child: SizedBox(
    
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(minimum: 0,
              maximum: 20,
              startAngle: 270,
              endAngle: 270,
              showLabels: false,
              showTicks: false,
              radiusFactor: 0.7,
              axisLineStyle: AxisLineStyle(
                  cornerStyle: CornerStyle.bothCurve,
                  color: Colors.black12,
                  thickness: 25),
              pointers: <GaugePointer>[
                RangePointer(
                    value: _volumeValue,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 23,
                    sizeUnit: GaugeSizeUnit.logicalPixel,
                    gradient: const SweepGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 237, 28, 94),
                          Color.fromARGB(255, 255, 81, 0)
                        ],
                        stops: <double>[0.25, 0.75]
                    )),
                MarkerPointer(
                    value: _volumeValue,
                    enableDragging: true,
                    onValueChanged: onVolumeChanged,
                    markerHeight: 34,
                    markerWidth: 34,
                    markerType: MarkerType.circle,
                    color: Colors.red,
                    borderWidth: 2,
                    borderColor: Colors.white54)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    angle: 90,
                    axisValue: 5,
                    positionFactor: 0.2,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Charecters"),
                        Text(_volumeValue.ceil()
                            .toString() ,
                            style: const TextStyle(
                                fontSize: 52,
                                fontWeight: FontWeight
                                    .bold,
                                color: Color(0xFFCC2B5E))),
                      ],
                    )
                )
              ]
          )
        ]
     ),
    ),
   ),
 ),

 

                ),
                const SizedBox(height: 80),

        Expanded(child: Container(
          width: double.infinity,

          decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(19),topRight:Radius.circular(19)),color: Colors.white),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20,),
              const Text("GENARATE PASSWORD",style: TextStyle(fontSize: 15,color: Colors.red),),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
                    controller: _controller,
                    readOnly: true,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(suffixIcon: IconButton(onPressed: (){
                      
                final data= ClipboardData(text: _controller.text,);
                 Clipboard.setData(data);
                     
         const snackbar=SnackBar(content: Text("✓ password copied"),backgroundColor: Colors.red,);
         
                 ScaffoldMessenger.of(context)
                 ..removeCurrentSnackBar()
                 ..showSnackBar(snackbar);
         
                    }, icon: const Icon(Icons.copy))),
                   
                  ),
         ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [ buildCheckbox("Capital letters(A-Z) ", PasswordOption.Uppercase),
                buildCheckbox("Small letters(a-z)  ", PasswordOption.Lowercase),
               ],

      ),
      Column(
        children: [
           buildCheckbox("Numbers(0-9)", PasswordOption.Numbers),
                SizedBox(child: buildCheckbox(" Special Char(@#..)", PasswordOption.Special)),
        ],
      )
    ],
  ),
                
                buildbutton(),
                const SizedBox( 
                  height: 12,
                ),

            ],
          ),

        )),



              
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildbutton() {

    final backgroundColor=MaterialStateColor.resolveWith((states) => 
    states.contains(MaterialState.pressed)?Colors.pink:Colors.black
    );
   
    return IconButton(onPressed: (){
      
      final password=genetatepssword();
      _controller.text=password;
    }, icon: const Icon(Icons.refresh,color: Colors.pink,size: 50,));
  }




  Widget buildCheckbox(String title, PasswordOption option) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.red ,
          value: selectedOptions.contains(option),
          onChanged: (value) {
            setState(() {
              if (value != null && value) {
                selectedOptions.add(option);
              } else {
                selectedOptions.remove(option);
              }
            });
          },
        ),
        SizedBox(
          width:150,
          child: Text(title,style: TextStyle(color: Color.fromARGB(255, 118, 101, 100)) ,)),
      ],
    );
  }



  String genetatepssword(
  ){
    final length=_volumeValue.toInt();
const letterlowercase='abcdefghijklmnopqrstuvwxyz';
const letteruppercase='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
 const numbers='0123456789,';
 const special='@#*=+!£\$?(){}%';

String char="";
 if (selectedOptions.contains(PasswordOption.Uppercase)) {
      char += letteruppercase;
    }
    if (selectedOptions.contains(PasswordOption.Lowercase)) {
      char += letterlowercase;
    }
    if (selectedOptions.contains(PasswordOption.Numbers)) {
      char += numbers;
    }
    if (selectedOptions.contains(PasswordOption.Special)) {
      char += special;
    }

    if (char.isEmpty) {
      return 'Select at least one option';
    }
return List.generate(length.toInt(), (index) {
  final indexrandom= Random().nextInt(char.length);
  return char[indexrandom];
}).join('');
  }



   

  // ... (rest of your code)
}
enum PasswordOption {
  Uppercase,
  Lowercase,
  Numbers,
  Special,
}

