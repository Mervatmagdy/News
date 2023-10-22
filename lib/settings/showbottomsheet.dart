

import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';
import 'package:news/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ShowBottomSheet extends StatefulWidget {
  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Padding(
      padding:EdgeInsets.symmetric(
        horizontal:MediaQuery.sizeOf(context).width*0.1,
        vertical: MediaQuery.sizeOf(context).height*0.03
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         InkWell(
           onTap:(){
             provider.changeLanguage('en');

           },
           child: provider.language=='en'?getSelectedLanguage(AppLocalizations.of(context)!.english):
               getUnSelectedLanguage(AppLocalizations.of(context)!.english),
         ),
          SizedBox(height:20,),
          InkWell(
            onTap:(){
              provider.changeLanguage('ar');
            },
            child:provider.language=='ar'?getSelectedLanguage(AppLocalizations.of(context)!.arabic):
                getUnSelectedLanguage(AppLocalizations.of(context)!.arabic) ,
          )
        ],
      ),
    );
  }

Widget getSelectedLanguage(String language){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style:Theme.of(context).textTheme.titleSmall!.copyWith(color:MyTheme.primaryColor,fontSize:18),),
        Icon(Icons.check,size:25,color:MyTheme.primaryColor,)
      ],
    );
}
Widget getUnSelectedLanguage(String language){
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style:Theme.of(context).textTheme.titleSmall!.copyWith(color:MyTheme.blueGery,fontSize:18),),

      ],
    );
}
}
