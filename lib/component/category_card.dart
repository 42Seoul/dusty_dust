import 'package:dusty_dust/component/card_title.dart';
import 'package:dusty_dust/component/main_card.dart';
import 'package:dusty_dust/component/main_stat.dart';
import 'package:dusty_dust/model/stat_and_status_model.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final String region;
  final List<StatAndStatusModel> models;
  const CategoryCard({
    required this.models,
    required this.region,
    required this.lightColor,
    required this.darkColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: MainCard(
        backgroundColor: lightColor,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardTitle(
                  title: '종류별 통계',
                  backgroundColor: darkColor,
                ),
                Expanded(
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      children: models
                          .map(
                            (model) => MainStat(
                              category: DataUtils.getItemCodeKrString(
                                  itemCode: model.itemCode),
                              imgPath: model.status.imagePath,
                              level: model.status.label,
                              stat:
                                  '${model.stat.getLevelFromRegion(region)}${DataUtils.getUnitFromItemCode(itemCode: model.itemCode)}',
                              width: constraints.maxWidth / 3,
                            ),
                          )
                          .toList()

                      // List.generate(
                      //   20,
                      //   (index) => MainStat(
                      //     category: '미세먼지',
                      //     imgPath: 'asset/img/best.png',
                      //     level: '최고',
                      //     stat: '10㎍/㎥',
                      //     width: constraints.maxWidth / 3,
                      //   ),
                      // ),
                      ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
