import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/model/status_model.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final StatusModel status;
  final StatModel stat;
  final String region;

  const MainAppBar({
    required this.status,
    required this.stat,
    required this.region,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle ts = const TextStyle(
      color: Colors.white,
      fontSize: 30,
    );
    return SliverAppBar(
      expandedHeight: 500,
      backgroundColor: status.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  region,
                  style: ts.copyWith(
                    fontSize: 40,
                  ),
                ),
                Text(
                  DataUtils.getTimeFromDateTime(stat.dataTime),
                  style: ts.copyWith(fontSize: 20, fontWeight: FontWeight.w200),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  status.imagePath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 20),
                Text(
                  status.label,
                  style: ts.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  status.comment,
                  style: ts.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
