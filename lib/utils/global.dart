import 'package:flutter/cupertino.dart';

List<Map>dataList=[
  {"name":""},{"email":""},{"moblie":""},
];
List<Map> productList=[
  {"name":"","price":0,"quantity":0,"text1":TextEditingController(),"text2":TextEditingController(),"text3":TextEditingController()}
];
int total=0;
int gst=0;
void sum()
{
  for(int i=0;i<productList.length;i++)
  {
    total=total+((productList[i]["price"]*productList[i]["quantity"])as int);
  }
  gst=total+(total*18~/100);
}