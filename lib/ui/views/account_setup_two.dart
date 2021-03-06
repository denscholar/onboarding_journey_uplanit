import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uplanit_supplier/core/models/category.dart';
import 'package:uplanit_supplier/core/utils/custom_colors.dart';
import 'package:uplanit_supplier/core/viewmodels/category_provider.dart';
import 'package:uplanit_supplier/ui/dialogs/event_type_dialog.dart';
import 'package:uplanit_supplier/ui/widgets/custom_checkbox.dart';

import 'all_done.dart';

class AccountSetupTwo extends StatelessWidget {
  static const String ROUTE = '/accountSetupTwo';
  AccountSetupTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CategoryView(),
                )),
              ],
            ),
          ),
          Consumer<CategoryProvider>(
            builder: (context, value, child) => Opacity(
              opacity: value.selectedCategoryList.length > 0 ? 1 : .4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: CustomColor.uplanitBlue,
                ),
                child: InkWell(
                  onTap: value.selectedCategoryList.length == 0 ? null : () {
                    showDialog(
                      context: context,
                      builder: (context) => EventTypeDialog(),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Next',
                      style: GoogleFonts.workSans(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 53,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: CustomColor.uplanitBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What do you do?',
                  style: GoogleFonts.workSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
              Text(
                'You can select multiple options',
                style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, AllDone.ROUTE),
            child: Text(
              'Skip',
              textAlign: TextAlign.right,
              style: GoogleFonts.workSans(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryView extends StatefulWidget {
  CategoryView({
    Key key,
  }) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryProvider categoryProvider;
  @override
  void initState() {
    context.read<CategoryProvider>().loadCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    bool isCategoryLoading = categoryProvider.isCategoryLoading;
    List<Category> categories = categoryProvider.categoryList;

    return isCategoryLoading
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) =>
                _buildItem(context, index, categories),
          );
  }

  _buildItem(BuildContext context, index, list) {
    Category category = list[index];
    return GestureDetector(
      onTap: () {
        context.read<CategoryProvider>()
          ..addSelected(category)
          ..toggleSelected(index);
      },
      child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(category.image),
              fit: BoxFit.cover,
              colorFilter: !category.selected ? ColorFilter.mode(Colors.black, BlendMode.hue) : null,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: !category.selected ? Color.fromRGBO(0, 0, 0, 0.6) : null,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${category.name}',
                          style: GoogleFonts.workSans(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        CustomCheckBox(
                          isChecked: category.selected,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
