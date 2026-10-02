
import 'package:flutter/material.dart'; import '../services/progress_service.dart';
class ProgressScreen extends StatelessWidget{const ProgressScreen({super.key});
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Progress Belajar')),
 body:FutureBuilder<Map<String,int>>(future:ProgressService.get(),builder:(c,s){if(!s.hasData)return const Center(child:CircularProgressIndicator());final d=s.data!;
 return ListView(padding:const EdgeInsets.all(18),children:[
  _stat(c,'📖','Materi dibuka','${d['learned']}'),_stat(c,'✅','Jawaban quiz benar','${d['correct']}'),
  const SizedBox(height:12),const Card(child:Padding(padding:EdgeInsets.all(18),child:Text('Belajar sedikit setiap hari. Setelah menguasai satu level, lanjutkan ke level berikutnya.',style:TextStyle(fontSize:16))))]);});
 Widget _stat(BuildContext c,String i,String t,String v)=>Card(child:ListTile(leading:Text(i,style:const TextStyle(fontSize:30)),title:Text(t),trailing:Text(v,style:Theme.of(c).textTheme.headlineSmall)));
}
