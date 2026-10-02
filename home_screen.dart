
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});
 @override Widget build(BuildContext context)=>Scaffold(
  appBar:AppBar(title:const Text('日本語 Master'),centerTitle:true),
  body:ListView(padding:const EdgeInsets.all(16),children:[
   Container(padding:const EdgeInsets.all(22),decoration:BoxDecoration(borderRadius:BorderRadius.circular(24),
    gradient:const LinearGradient(colors:[Color(0xFF3949AB),Color(0xFF7E57C2)])),
    child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
     Text('Belajar Bahasa Jepang',style:TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.bold)),
     SizedBox(height:8),Text('Kotoba + Bunpō N5 sampai N3 • Offline',style:TextStyle(color:Colors.white70,fontSize:15))])),
   const SizedBox(height:16),
   _tile(context,'📚 Kotoba','Kosakata N5–N3','/kotoba'),
   _tile(context,'📝 Bunpō','Tata bahasa N5–N3','/bunpo'),
   _tile(context,'🎯 Quiz','Uji kemampuanmu','/quiz'),
   _tile(context,'📈 Progress','Lihat perkembangan belajar','/progress'),
  ]));
 Widget _tile(BuildContext c,String a,String b,String r)=>Card(child:ListTile(
  contentPadding:const EdgeInsets.all(14),title:Text(a,style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
  subtitle:Text(b),trailing:const Icon(Icons.arrow_forward_ios_rounded),onTap:()=>Navigator.pushNamed(c,r)));
}
