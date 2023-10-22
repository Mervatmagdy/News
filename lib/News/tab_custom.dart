import 'package:flutter/material.dart';
import 'package:news/Model/source_response.dart';
import 'package:news/MyTheme.dart';

class TabCustom extends StatelessWidget {
  Sources? sources;
  bool selectedItem;
  TabCustom({required this.sources,required this.selectedItem});
  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.symmetric(horizontal:12,vertical:7),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: selectedItem==false ? Colors.transparent : MyTheme.primaryColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              width:3,
              color: selectedItem==false ? MyTheme.primaryColor : Colors.transparent)),
      child: Text(sources?.name ?? "",
          style:Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18,
            color:selectedItem==false?MyTheme.primaryColor:MyTheme.whiteColor
          )),
    );
  }
}
