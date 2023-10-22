import 'package:flutter/material.dart';
import 'package:news/Category/category_item.dart';
import 'package:news/Model/caregory_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoryFragment extends StatefulWidget {
  static const routeName = 'category_fragment';
  Function onClickCategory;
  CategoryFragment({required this.onClickCategory});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {


  @override
  Widget build(BuildContext context) {
    var categoryList = CategoryData.getCategory(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:20),
            child: Text(
              AppLocalizations.of(context)!.pick,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 13),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  widget.onClickCategory(categoryList[index]);
                  setState(() {

                  });
                },
                  child: CategoryItem(
                      categoryData: categoryList[index], index: index));
            },
            itemCount: categoryList.length,
          ))
        ],
      ),
    );
  }
}
