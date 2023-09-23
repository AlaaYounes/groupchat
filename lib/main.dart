
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:chatgroup/cubit/cubit.dart';
import 'package:chatgroup/login_screen.dart';
import 'package:chatgroup/shared/Network/Auth.dart';
import 'package:chatgroup/shared/component/Bloc_Observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
String? imagePath;
Future<void> main() async {
  AwesomeNotifications().initialize('resource://drawable/askme', [
    NotificationChannel(
        channelKey: 'schedule key',
        channelName: 'schedule channel',
        channelDescription: 'notification for test',
        playSound: true,
        channelShowBadge: true),
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  Auth auth = Auth();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(create: (context) => AppCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AskMe',
          home: LoginScreen(),
        )
      // MaterialApp(
      //
      //   home: startWidget,
      //   theme: ThemeData(
      //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //         selectedItemColor: Colors.deepOrange,
      //         unselectedItemColor: Colors.grey),
      //   ),
      // ),
    );
  }
}
// var startWidget = AuthScreen();
// String? imagePath;
// Future<void> main() async {
//   AwesomeNotifications().initialize('resource://drawable/askme', [
//     NotificationChannel(
//         channelKey: 'schedule key',
//         channelName: 'schedule channel',
//         channelDescription: 'notification for test',
//         playSound: true,
//         channelShowBadge: true),
//   ]);
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   Bloc.observer = MyBlocObserver();
//   Auth auth = Auth();
//   imagePath = await auth.saveAssetImageToDevice();
//
//   runApp(MyApp());
// }
//
// XFile imageFile = XFile(imagePath!);
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: [
//           BlocProvider<AppCubit>(create: (context) => AppCubit()..getUserData(uid)),
//         ],
//         child: BlocConsumer<AppCubit,AppStates>(
//             builder: (BuildContext context, state) {
//               return MaterialApp(
//                 home: SplashScreen(),
//                 theme: ThemeData(
//                   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                       selectedItemColor: Colors.deepOrange,
//                       unselectedItemColor: Colors.grey),
//                 ),
//               );
//             },
//             listener: (BuildContext context, Object? state) {},
//             ),
//         );
//     }
// }