// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ramadanapp/Controller/SettingProvider.dart';
// import 'package:ramadanapp/Controller/homeProvider.dart';
// import 'package:ramadanapp/view/customWidget/loadingIndicator.dart';
//
//
// class QiblahScreen extends StatefulWidget {
//   const QiblahScreen({super.key});
//
//   @override
//   State<QiblahScreen> createState() => _QiblahScreenState();
// }
//
// Animation<double>? animation;
// AnimationController? _animationController;
// double begin = 0.0;
//
// class _QiblahScreenState extends State<QiblahScreen>
//     with SingleTickerProviderStateMixin {
//
//
//   @override
//   void initState() {
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 500));
//     animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
//     super.initState();
//   }
// @override
//   void dispose() {
//     // TODO: implement dispose
//     _animationController!.dispose();
//     super.dispose();
//
// }
//   @override
//   Widget build(BuildContext context) {
//     final homeProvider=Provider.of<HomeProvider>(context);
//     final settingProvider=Provider.of<SettingProvider>(context);
//
//     return WillPopScope(onWillPop: ()async{
//       homeProvider.Reset();
//       settingProvider.ChangeIndex(0);
//       Navigator.pop(context);
//       return true;
//     },
//
//       child: SafeArea(
//         child: Scaffold(
//             body: Container(decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage('assets/images/whitebackground.jpg'),fit: BoxFit.fill)
//             ),
//               child: StreamBuilder(
//                 stream: FlutterQiblah.qiblahStream,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return loadingIndicator(text: 'Loading .....');
//
//                   }
//
//                   //if(snapshot.hasData){
//                     final qiblahDirection = snapshot.data;
//                     animation = Tween(
//                       begin: begin,
//                       end: (qiblahDirection!.qiblah * (pi / 180) * -1),
//                     ).animate(_animationController!);
//                     begin = (qiblahDirection.qiblah * (pi / 180) * -1);
//                     _animationController!.forward(from: 0);
//
//                     return Padding(
//                       padding:  EdgeInsets.only(right: 5.0),
//                       child: Center(
//                         child: AnimatedBuilder(
//                           animation: animation!,
//                           builder: (context, child) => Transform.rotate(
//                             angle: animation!.value,
//                             child: Image.asset(
//                               'assets/images/qibla_image.png',
//                               height:200.h,
//                               fit: BoxFit.contain,
//                          ),
//                           ),
//                         ),
//                       ),
//                     );
//                 //  }
//                 },
//               ),
//             ),
//           ),
//       ),
//
//     );
//   }
// }
///qibla
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ramadanapp/Controller/SettingProvider.dart';
// import 'package:ramadanapp/Controller/homeProvider.dart';
// import 'package:ramadanapp/view/constant.dart';
// import 'package:ramadanapp/view/Screens/qiblaScreen.dart';
//
//
// class qibla extends StatelessWidget {
//
//   bool hasPermission = false;
//
//   final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
//   @override
//   Widget build(BuildContext context) {
//     final homeProvider=Provider.of<HomeProvider>(context);
//     final settingProvider=Provider.of<SettingProvider>(context);
//
//     return WillPopScope(onWillPop: ()async{
//       homeProvider.Reset();
//       settingProvider.ChangeIndex(0);
//       Navigator.pop(context);
//       return true;
//     },
//
//       child: Scaffold(
//         body:
//         Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/whitebackground.jpg'),fit: BoxFit.fill)
//           ),
//           child: FutureBuilder(
//               future: _deviceSupport,
//               builder: (context, AsyncSnapshot<bool?> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: Text('Waitting ......'),
//                   );
//                 }
//               else   if (snapshot.hasError) {
//                   return Center(
//                     child: Text('Error: ${snapshot.error.toString()}'),
//                   );
//                 }
//               else   if (snapshot.data!) {
//                   return  QiblahScreen();
//                 }
//                 else {
//                   return  mytext();
//                 }
//
//               }
//           ),
//         ),
//
//
//       ),
//     );
//   }
//   mytext(){
//     return  Center(
//       child: Container(height:80.h,
//           margin: EdgeInsets.all(20.h),
//           padding: EdgeInsets.all(20.h),
//
//           width: ScreenUtil().screenWidth,
//           decoration: BoxDecoration(color: Colors.white,boxShadow: [
//             BoxShadow(
//               blurRadius: 0.2,
//               spreadRadius: 0.2,
//               color: lightgreen
//             )
//           ],
//               borderRadius:BorderRadius.circular(10.h) ),
//           child:  Center(
//               child: FittedBox(
//                   fit: BoxFit.scaleDown,
//                   child: Text(
//                       "Qibla support for this device is not available")))
//       ),
//     );
//   }
// }
