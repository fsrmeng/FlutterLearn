import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MaterialApp(
      home: SplashScreenApp(),
    ));

class SplashScreenApp extends StatefulWidget {
  @override
  _SplashScreenAppState createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    animation.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        //pushAndRemoveUntil：跳转页面，并销毁当前控件
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePageApp()), (router) => router == null);
      }
    });

    //播放动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //透明度动画组件
    return FadeTransition(
        opacity: animation,
        child: Image.network(
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
          fit: BoxFit.cover,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
