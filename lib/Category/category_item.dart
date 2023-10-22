import 'package:flutter/material.dart';
import 'package:news/Model/caregory_data.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;
  CategoryItem({required this.categoryData,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top: 10),
      decoration:BoxDecoration(
        color:categoryData.color,
        borderRadius:BorderRadius.only(
          bottomRight:Radius.circular(index%2==0?0:30) ,
          bottomLeft:Radius.circular(index%2==0?30:0)  ,
          topLeft:Radius.circular(30) ,
            topRight:Radius.circular(30)
        )
      ),
      child:Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(categoryData.image??"",height:MediaQuery.of(context).size.height*0.14,),
          Text(categoryData.title??"",style:Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
