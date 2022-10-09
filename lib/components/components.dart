import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../web_view/web_view_screen.dart';

Widget buildArticleItem(context, article) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(article['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${article["urlToImage"]}'))),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Text(
                      '${article["publishedAt"]}',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget LoadingCircle() => Center(
      child: CircularProgressIndicator(),
    );

Widget articleBuilder(context, list, {isSearch = false}) => ConditionalBuilder(
    builder: (BuildContext context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(context, list[index]),
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: list.length),
    condition: list.isNotEmpty,
    fallback: (context) => isSearch
        ? Center(
            child: Text('Type something !'),
          )
        : LoadingCircle());
