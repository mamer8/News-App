import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'cubit/bloc_observed.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'network/remote/dio_helper.dart';
import 'news_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  // await CacheHelper.init();
  // bool? isDark = CacheHelper.getData(key: 'isDark');
  // runApp(MyApp(isDark!));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //final bool isDark;
  // const MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.orangeAccent,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: HexColor('7856FF'),
                elevation: 20),
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme: IconThemeData(color: Colors.black),
                color: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            scaffoldBackgroundColor: Colors.white,
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.lightBlue,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.orangeAccent,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black12,
                selectedItemColor: HexColor('7856FF'),
                unselectedItemColor: Colors.grey,
                elevation: 20),
            appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: Colors.white),
                color: HexColor('15202B'),
                elevation: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            scaffoldBackgroundColor: HexColor('15202B'),
            textTheme:
                const TextTheme(bodyText2: TextStyle(color: Colors.white)),
          ),
          themeMode:
              NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const NewsLayout(),
        ),
      ),
    );
  }
}
