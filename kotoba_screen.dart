
import 'package:flutter/material.dart';
import '../models.dart'; import '../services/data_service.dart'; import '../services/progress_service.dart'; import '../widgets/level_chips.dart';
class KotobaScreen extends StatefulWidget{const KotobaScreen({super.key});@override State<KotobaScreen> createState()=>_S();}
class _S extends State<KotobaScreen>{String level='ALL',query='';
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Kotoba • Kosakata')),
 body:FutureBuilder<List<Kotoba>>(future:DataService.kotoba(),builder:(c,s){if(!s.hasData)return const Center(child:CircularProgressIndicator());
 final d=s.data!.where((x)=>(level=='ALL'||x.level==level)&&(query.isEmpty||'${x.kanji} ${x.kana} ${x.romaji} ${x.meaning}'.toLowerCase().contains(query.toLowerCase()))).toList();
 return Column(children:[
  Padding(padding:const EdgeInsets.fromLTRB(16,8,16,4),child:TextField(decoration:const InputDecoration(prefixIcon:Icon(Icons.search),hintText:'Cari...',filled:true),onChanged:(v)=>setState(()=>query=v))),
  Padding(padding:const EdgeInsets.all(12),child:LevelChips(selected:level,onChanged:(v)=>setState(()=>level=v))),
  Expanded(child:ListView.builder(padding:const EdgeInsets.symmetric(horizontal:12),itemCount:d.length,itemBuilder:(c,i)=>Card(child:ExpansionTile(
   onExpansionChanged:(o){if(o)ProgressService.addLearned();},
   title:Text('${d[i].kanji}  ${d[i].kana}',style:const TextStyle(fontSize:21,fontWeight:FontWeight.bold)),
   subtitle:Text('${d[i].meaning} • ${d[i].level}'),
   children:[Padding(padding:const EdgeInsets.fromLTRB(20,0,20,18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Text(d[i].romaji,style:const TextStyle(fontStyle:FontStyle.italic)),const SizedBox(height:8),
    Text(d[i].example,style:const TextStyle(fontSize:17,fontWeight:FontWeight.w600)),Text(d[i].exampleMeaning)]))
  ])))]);
 }));
}
