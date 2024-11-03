import 'package:courses_eshop_app/common/utils/app_styles.dart';
import 'package:courses_eshop_app/firebase_options.dart';
import 'package:courses_eshop_app/screens/sign_in/sign_in_screen.dart';
import 'package:courses_eshop_app/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/sign_up/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData,
        initialRoute: WelcomeScreen.kRoute,
        routes: {
          WelcomeScreen.kRoute: (context) => WelcomeScreen(),
          SignInScreen.kRoute: (context) => SignInScreen(),
          SignUpScreen.kRoute: (context) => SignUpScreen(),
        },
      ),
    );
  }
}

// final appCount = StateProvider<int>((ref) {
//   return 1;
// });
//
// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int count = ref.watch(appCount);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text('Riverpod app'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               count.toString(),
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => SecondPage(),
//           ));
//           ref.read(appCount.notifier).state++;
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
// class SecondPage extends ConsumerWidget {
//   const SecondPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int count = ref.watch(appCount);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text(count.toString()),
//       ),
//     );
//   }
// }
