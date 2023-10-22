import 'package:flutter/material.dart';
import 'package:news/Category/category-fragment.dart';
import 'package:news/Category/category_details.dart';
import 'package:news/Home/home-drawer.dart';
import 'package:news/Home/search_custom.dart';
import 'package:news/Model/caregory_data.dart';
import 'package:news/MyTheme.dart';
import 'package:news/settings/setting_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';
  bool visible=true;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.whiteColor,
      child: Stack(
        children: [
          Image.asset('assets/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          Scaffold(
            backgroundColor: Colors.transparent,
            drawer: Drawer(
              child: HomeDrawer(onClickedDrawer: onClickedDrawer),
            ),
            appBar:
            AppBar(
            actions: [
              Visibility(
                visible:widget.visible,
                child: IconButton(onPressed: (){
                  showSearch(context: context, delegate:SearchCustom());
                }, icon:Icon(Icons.search)),
              )
            ]
              ,
              title: Text(
                selectedDrawer == HomeDrawer.settings
                    ?AppLocalizations.of(context)!.setting:
                selectedCategory==null
                    ? AppLocalizations.of(context)!.news_app_title
                        : selectedCategory!.title!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            body: selectedDrawer == HomeDrawer.settings
                ? SettingsScreen()
                : selectedCategory == null
                    ? CategoryFragment(onClickCategory: onSelectedCategory)
                    : CategoryDetails(categoryId: selectedCategory?.id ?? ""),
          )
        ],
      ),
    );
  }

  CategoryData? selectedCategory;

  void onSelectedCategory(CategoryData newCategory) {
    selectedCategory = newCategory;
    widget.visible=false;
    setState(() {});
  }

  int selectedDrawer = HomeDrawer.categories;
  void onClickedDrawer(int newSelected) {
    selectedDrawer = newSelected;
    widget.visible=true;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
