import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';
import 'package:news/Providers/AppConfigProvider.dart';
import 'package:news/settings/showbottomsheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07,
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
           AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: MyTheme.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.start,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.04,
                horizontal: MediaQuery.sizeOf(context).width * 0.03),
            decoration: BoxDecoration(
                color: MyTheme.whiteColor,
                border: Border.all(color: MyTheme.primaryColor)),
            child: InkWell(
              onTap: () {
                getShowBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.language == 'en' ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.primaryColor, fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: MyTheme.primaryColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void getShowBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowBottomSheet();
      },
    );
  }
}
