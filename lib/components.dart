import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article,context)=>Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(width: 30,),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('${article['title']}',
                    style:Theme.of(context).textTheme.bodyText1,
                    maxLines: 4,
                    ),
                  ),
                  Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );