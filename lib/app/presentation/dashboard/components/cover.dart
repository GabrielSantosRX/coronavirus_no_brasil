import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cover extends StatelessWidget {
  const Cover({
    @required bool isKeyboardVisible,
    @required this.context,
    Key key,
    this.scale,
  })  : _isKeyboardVisible = isKeyboardVisible,
        super(key: key);

  final bool _isKeyboardVisible;
  final BuildContext context;
  final double scale;

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
        opacity: _isKeyboardVisible ? 0.0 : 1,
        duration: const Duration(milliseconds: 280),
        child: Container(
          height:
              !_isKeyboardVisible ? ScreenUtil.getHeight(context) * scale : 0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: const DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              Constants.svgLogoName,
              height: 314,
            ),
          ),
        ),
      );
}
