import 'package:argo/argo.dart';
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
              ConditionalResponsiveWidget(
                conditionsMatch: const [
                  ConditionBreakpoint<double>.smallerThan(
                    value: 22,
                    breakpoint: 765,
                  ),
                  ConditionBreakpoint<double>.smallerThan(
                    value: 18,
                    breakpoint: 733,
                  ),
                  ConditionBreakpoint<double>.smallerThan(
                    value: 16,
                    breakpoint: 700,
                  ),
                  ConditionBreakpoint<double>.smallerThan(
                    value: 24,
                    breakpoint: 650,
                  ),
                ],
                builder: (ctx, match) {
                  final textStyle = match != null
                      ? Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: match)
                      : Theme.of(context).textTheme.headline3;

                  return RichText(
                    text:
                        TextSpan(text: 'Landing', style: textStyle, children: [
                      TextSpan(
                        text: 'Page',
                        style: textStyle,
                      )
                    ]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
