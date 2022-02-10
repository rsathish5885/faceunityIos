import 'package:examle/widget/round_slider_trackshape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../strings.dart';

class SliderWidget extends StatefulWidget {
  final Function(double value) onChange;
  late  double level;
  final double max;
  final String beautyType;
  final bool? isShowClose;

  SliderWidget({
    required this.onChange,
    required this.level,
    required this.beautyType,
    this.isShowClose, required this.max,
  });

  @override
  State<StatefulWidget> createState() => _SliderDemo();
}

class _SliderDemo extends State<SliderWidget> {
  // double _level = 0;

  @override
  void initState() {
    super.initState();
    // _level = widget.level;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.beautyType,
                  style: TextStyle(
                      color: UIColors.black_222222,
                      fontSize: 14,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SliderTheme(
                      //自定义风格
                      data: SliderTheme.of(context).copyWith(

                          ///进度条滑块左边颜色
                          activeTrackColor: Color(0xff337EFF),

                          ///进度条滑块右边颜色
                          inactiveTrackColor: Color(0xffF0F0F2),

                          ///进度条形状,这边自定义两头显示圆角
                          trackShape: RoundSliderTrackShape(radius: 5),

                          ///滑块颜色
                          thumbColor: Colors.white,

                          ///滑块拖拽时外圈的颜色
                          overlayColor: Color.fromRGBO(51, 126, 255, 0.70),
                          overlayShape: RoundSliderOverlayShape(
                            ///可继承SliderComponentShape自定义形状
                            overlayRadius: 12, //滑块外圈大小
                          ),
                          thumbShape: RoundSliderThumbShape(
                            ///可继承SliderComponentShape自定义形状
                            disabledThumbRadius: 10,

                            ///禁用是滑块大小
                            enabledThumbRadius: 10,

                            ///滑块大小
                          ),
                          inactiveTickMarkColor: Colors.black,
                          tickMarkShape: RoundSliderTickMarkShape(
                            ///继承SliderTickMarkShape可自定义刻度形状
                            tickMarkRadius: 2.0, //刻度大小
                          ),
                          showValueIndicator:
                              ShowValueIndicator.onlyForDiscrete,

                          ///气泡显示的形式
                          valueIndicatorColor: Colors.red,

                          ///气泡颜色
                          valueIndicatorShape:
                              PaddleSliderValueIndicatorShape(),

                          ///气泡形状
                          valueIndicatorTextStyle:
                              TextStyle(color: Colors.black),

                          ///气泡里值的风格
                          trackHeight: 4

                          ///进度条宽度

                          ),
                      child: Slider(
                        value:  widget.level.toDouble(),
                        min: 0,
                        max: widget.max,
                        // label: "等级:$value",
                        //             //气泡的值
                        //             divisions: 10,
                        //             //进度条上显示多少个刻度点
                        label: '${ widget.level}',
                        onChanged: (double newValue) {
                          setState(() {
                            var temp = double.parse(newValue.toStringAsFixed(2));
                            if ( widget.level != temp) {
                              widget.level = temp;
                            }
                          });
                          widget.onChange( widget.level);
                        },
                      )),
                )
              ])),
            ],
          ),
        ));
  }

  Widget line() {
    return Container(
      color: Colors.white,
      child: Container(
        color: UIColors.colorE8E9EB,
        height: 0.5,
      ),
    );
  }
}
