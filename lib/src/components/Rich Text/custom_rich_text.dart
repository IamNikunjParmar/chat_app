import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../package/resocues/color.dart';
import '../../package/resocues/theme_provider.dart';

Widget richTextPage(double screenHeight, double screenWidth, String svgPath, String text, BuildContext context) {
  final isPage1 = text.contains('family');
  final themeProvider = Provider.of<ThemeProvider>(context);
  final textColor = Theme.of(context).textTheme.bodyMedium?.color;
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Align(
          child: SizedBox(
            height: screenHeight * 0.5,
            child: SvgPicture.asset(svgPath),
          ),
        ),
        const Gap(50),
        Align(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                if (isPage1) ...[
                  TextSpan(
                    text: 'Connect easily with\nyour ',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor, // Conditional color
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: 'family',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF1EC85A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor, // Conditional color
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: 'friends',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.primaryGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '\nover countries',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor, // Conditional color
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ] else ...[
                  TextSpan(
                    text: 'Enjoy ',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: 'secure ',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.primaryGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: 'private',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.primaryGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' \nconversations\nwith your ',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor, //light theme
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: 'loved ',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.primaryGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'ones ',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
