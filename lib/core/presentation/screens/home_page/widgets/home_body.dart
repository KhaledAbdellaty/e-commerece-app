import 'package:flutter/material.dart';
import 'package:new_e_commerece_app/constants/size_config.dart';
import 'package:new_e_commerece_app/core/presentation/widgets/custom_horizontal_list_view.dart';

import '../../../../../constants/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 13),
          child: homeBar(),
        ),
        SizedBox(
          width: SizeConfig.defaultSize! * 2,
        ),
        searchBar(),
        Expanded(child: CustomHorizontalListView()),
      ],
    );
  }

  Widget homeBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Good morninig ...',
          style: TextStyle(
              color: primaryFontColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        Image.asset('assets/icons/shopping-cart.png')
      ],
    );
  }

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultSize! * 4,
        vertical: SizeConfig.defaultSize!,
      ),
      padding: EdgeInsets.all(SizeConfig.defaultSize!),
      child: Row(
        children: [
          Image.asset('assets/icons/search.png'),
          Expanded(
              child: TextFormField(
            showCursor: false,
            style: const TextStyle(color: secondaryFontColor),
            decoration: const InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                border: InputBorder.none,
                hintText: 'Search food',
                hintStyle: TextStyle(
                  color: placeholderColor,
                )),
          )),
        ],
      ),
    );
  }
}
