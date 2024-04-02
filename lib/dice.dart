//
// class DicePage extends StatefulWidget {
//   @override
//   _DicePageState createState() => _DicePageState();
// }
//
// class _DicePageState extends State<DicePage> {
//   int leftDiceNumber = 1;
//   int rightDiceNumber = 1;
//
//   void changeDiceFace() {
//     setState(() {
//       leftDiceNumber = Random().nextInt(6) + 1;
//       rightDiceNumber = Random().nextInt(6) + 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: InkWell(onTap: (){
//                 changeDiceFace();
//               },
//                 child: Image.asset(
//                   'assets/dice$leftDiceNumber.png',
//                 ),
//               ),
//             ),
//           ),
//           //Get students to create the second die as a challenge
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: GestureDetector(
//                 child: Image.asset(
//                   'assets/dice$rightDiceNumber.png',
//                 ),
//                 onTap: () {
//                   changeDiceFace();
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }