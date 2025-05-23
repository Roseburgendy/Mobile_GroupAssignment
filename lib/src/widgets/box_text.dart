import 'package:flutter/material.dart';
import 'package:assignment1/src/shared/styles.dart';

class BoxText extends StatelessWidget
{
    final String text;
    final TextStyle style;

    BoxText.ExtraBigHeadline(this.text, {Color color = Colors.black})
        : style= ExtraBigHeadlineStyle.copyWith(color: color);

    BoxText.Headline1(this.text, {Color color = Colors.black})
        : style= Headline1Style.copyWith(color: color);

    BoxText.Headline2(this.text, {Color color = Colors.black})
        : style= Headline2Style.copyWith(color: color);

    BoxText.Headline3(this.text, {Color color = Colors.black})
        : style= Headline3Style.copyWith(color: color);

    BoxText.Headline4(this.text, {Color color = Colors.black})
        : style= Headline4Style.copyWith(color: color);

    BoxText.Title(this.text, {Color color = Colors.black})
        : style= TitleStyle.copyWith(color: color);

    BoxText.Subtitle(this.text, {Color color = Colors.black})
        : style= SubtitleStyle.copyWith(color: color);

    BoxText.Input(this.text, {Color color = Colors.black})
        : style= InputStyle.copyWith(color: color);

    BoxText.Number(this.text, {Color color = Colors.black})
        : style= NumberStyle.copyWith(color: color);

    BoxText.Button(this.text, {Color color = Colors.black})
        : style= myButtonStyle.copyWith(color: color);

    BoxText.Overline(this.text, {Color color = Colors.black})
        : style= OverlineStyle.copyWith(color: color);

    BoxText.Caption(this.text, {Color color = Colors.black})
        : style= CaptionStyle.copyWith(color: color);

    BoxText.Body(this.text, {Color color = Colors.black})
        : style= BodyStyle.copyWith(color: color);

    @override
    Widget build(BuildContext context) 
    {
        return Text(
            text,
            style: style
        );
    }
}
