import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          var list = cubit.search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onSaved: (value) {
                      cubit.getSearchNews(searcher: value!);
                      print(value);
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'Search cannot be blank' : null,
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      prefixIconColor: Colors.white,
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                    onChanged: (String? value) {
                      cubit.getSearchNews(searcher: value!);
                    },
                  ),
                ),
                Expanded(child: articleBuilder(context, list, isSearch: true)),
              ],
            ),
          );
        });
  }
}
