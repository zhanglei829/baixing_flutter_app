import 'package:baixing_flutter_app/pages/cart_page.dart';
import 'package:baixing_flutter_app/pages/category_page.dart';
import 'package:baixing_flutter_app/pages/home_page.dart';
import 'package:baixing_flutter_app/pages/member_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/current_index.dart';



class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心'),
    )
  ];

  final List<Widget> tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];





  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<CurrentIndexProvide>(
      builder: (context,child,val){
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: val.currentIndex,
            items: bottomTabs,
            onTap: (index){
              Provide.value<CurrentIndexProvide>(context).changeCurrentIndex(index);
            },
          ),
          body: IndexedStack(
            index: val.currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}
