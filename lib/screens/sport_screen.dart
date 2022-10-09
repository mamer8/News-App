import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var list = NewsCubit.get(context).sports;
          return articleBuilder(context, list);
        });
  }
}
