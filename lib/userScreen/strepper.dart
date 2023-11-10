
// import 'package:flutter/material.dart';
// class LoadingPage extends StatefulWidget {
//   const LoadingPage({super.key});

// final color;
//   final String? imagesp;
//   final pdname;
//   final rate;
//   final discriptions;
//   @override
//   State<LoadingPage> createState() => _LoadingPageState();
// }

// class _LoadingPageState extends State<LoadingPage> {



//   int currentstep=0;
//  List<Step> getSteps()=>[
//       //welcome step................................................................
//       Step(isActive: currentstep>=0,
//         title: Text(""), content:Column(
//           children:  [
//              SizedBox(height: 50,),
//              Text("Welcome to MediLink",style: TextStyle(
//               color: const Color.fromARGB(255, 80, 146, 199),fontSize: 20,fontWeight: FontWeight.w700),
//               ),
//              SizedBox(height: 50),
//              Text("We take pride in being your trusted healthcare partner, committed to your well-being and providing you with the highest standards of healthcare services.",
//              style: TextStyle(fontSize: 20),),
//             //Image.network('https://cdn.dribbble.com/users/187497/screenshots/1725519/medical-icons.gif'),
//             SizedBox(height: 60,)
//           ],
        
//         )
//         ),
    
    
//       Step(isActive: currentstep>=1,
//         title: Text(""), content: Column(
//           children: [
//             Image.network('https://marketplace.canva.com/EAEIGWJ75X0/1/0/1130w/canva-purple-and-white-proper-mask-use-covid-poster-MijN_9caAzc.jpg')
//           ],
//         )),
      
      
//       Step(isActive: currentstep>=2,
//         title: Text(""), content: Column(
//           children: [
//             Image.network('https://marketplace.canva.com/EAD22Nd3Tzo/1/0/1131w/canva-purple-when-to-wear-a-mask-coronavirus-poster-sneeze-tap-rmWTnOv5hKI.jpg')
//           ],
//         ))
//     ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//       ),
//       body: Container(
//         //color:Color.fromARGB(200, 13, 226, 119),
        
//         child: Stepper(
//           type: StepperType.horizontal,
//           steps: getSteps(),
//           currentStep:currentstep ,
//           onStepContinue:() {
//             final isLastStep = currentstep == getSteps().length-1;
//             if(isLastStep){
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
//             }
//             else{
//                setState(()=>currentstep += 1);
//             }          
//           }, 
//           onStepCancel: 
//               currentstep==0 ? null : () => setState(() =>currentstep -= 1
//               )
//           ),
//          ));
//     }
// }