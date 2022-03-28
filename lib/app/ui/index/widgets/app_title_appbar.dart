import 'package:base_web_landing/app/ui/shared/top_menu/points_decoration_widget.dart';
import 'package:base_web_landing/config/values/values.dart';
import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: getHorizontalPaddingMainPages(context),
        child: SizedBox(
          height: kSizeHeaderBar,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PointsDecorationWidget(
                colors: [
                  kYellowColor,
                  kCreamColor,
                  kCreamColor,
                  kYellowColor,
                ],
              ),
              RichText(
                text: TextSpan(
                    text: 'Landing',
                    style: Theme.of(context).textTheme.headline3,
                    children: [
                      TextSpan(
                        text: 'Page',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: kPrimaryColor),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
