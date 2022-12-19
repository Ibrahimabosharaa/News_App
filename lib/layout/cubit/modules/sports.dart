import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components.dart';
import '../cubit.dart';
import '../states.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
        condition: list.length>0,
         builder:(context)=> ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildArticleItem(list[index],context), 
          separatorBuilder: (context,index)=>  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                  ),
           itemCount: 10,
           ),
         fallback: (context)=>Center(child: CircularProgressIndicator()),
         );
      },
      
    );
  }
}