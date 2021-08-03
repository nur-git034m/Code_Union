import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appl/src/common/constants/app_paddings.dart';
import 'package:flutter_appl/src/common/constants/text_styles.dart';
import 'package:flutter_appl/src/common/widgets/search_text_field.dart';
import 'package:flutter_appl/src/data/dummy_data.dart';

class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: AppPaddings.horizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 33,
                ),
                SearchTextField(),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: shoppingCenters.length,
                  itemBuilder: (context, index) {
                    final shoppingCenter = shoppingCenters[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            shoppingCenter.imagePath,
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  bottom: 12,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shoppingCenter.name,
                                      style: AppTextStyles.headline2,
                                    ),
                                    Text(shoppingCenter.description,
                                        style: AppTextStyles.description2),
                                    Text(shoppingCenter.address,
                                        style: AppTextStyles.description2),
                                  ],
                                ),
                              ),
                              Expanded(child: Icon(CupertinoIcons.heart)),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
