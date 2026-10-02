
import 'package:flutter/material.dart';
import '../models.dart'; import '../services/data_service.dart'; import '../widgets/level_chips.dart';
class BunpoScreen extends StatefulWidget{const BunpoScreen({super.key});@override State<BunpoScreen> createState()=>_S();}
class _S extends State<BunpoScreen>{String level='ALL',query='';
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Bunpō • 文法')),
 body:FutureBuilder<List<Bunpo>>(future:DataService.bunpo(),builder:(c,s){if(!s.hasData)return const Center(child:CircularProgressIndicator());
 final d=s.data!.where((x)=>(level=='ALL'||x.level==level)&&(query.isEmpty||'${x.pattern} ${x.formula} ${x.meaning}'.toLowerCase().contains(query.toLowerCase()))).toList();
 return Column(children:[
  Padding(padding:const EdgeInsets.fromLTRB(16,8,16,4),child:TextField(decoration:const InputDecoration(prefixIcon:Icon(Icons.search),hintText:'Cari pola bunpō...',filled:true),onChanged:(v)=>setState(()=>query=v))),
  Padding(padding:const EdgeInsets.all(12),child:LevelChips(selected:level,onChanged:(v)=>setState(()=>level=v))),
  Expanded(child:ListView.builder(padding:const EdgeInsets.symmetric(horizontal:12),itemCount:d.length,itemBuilder:(c,i)=>Card(child:ExpansionTile(
   title:Text(d[i].pattern,style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),subtitle:Text('${d[i].level} • ${d[i].meaning}'),
   children:[Padding(padding:const EdgeInsets.fromLTRB(20,0,20,18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    const Text('Rumus',style:TextStyle(fontWeight:FontWeight.bold)),Text(d[i].formula),const SizedBox(height:10),
    Text(d[i].example,style:const TextStyle(fontSize:17,fontWeight:FontWeight.w600)),Text(d[i].exampleMeaning),const SizedBox(height:8),Text(d[i].meaning)]))
  )))]);
 }));
}
