import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/providers/counter_provider.dart';
import 'package:providers_example/screens/detail_screen.dart';
import 'package:providers_example/screens/home_screen.dart';
import 'package:providers_example/screens/userform_screen.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UserFormScreen(),
        // initialRoute: DetailScreen(),
        routes: {
          DetailScreen.routeName: (BuildContext context) => DetailScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          UserFormScreen.routeName: (_) => UserFormScreen(),
        },
      ),
    );
  }
}
