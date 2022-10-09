import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour/screens/search_screen.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            titleSpacing: 20,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchNews()));
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    NewsCubit.get(context).changeThemeMode();
                  },
                  icon: Icon(Icons.brightness_2_outlined))
            ],
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changebottomnavbar(index);
            },
          ),
        );
      },
    );
  }
}
