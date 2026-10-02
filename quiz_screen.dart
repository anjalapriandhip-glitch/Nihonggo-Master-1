
import 'dart:math'; import 'package:flutter/material.dart'; import '../models.dart'; import '../services/data_service.dart'; import '../services/progress_service.dart'; import '../widgets/level_chips.dart';
class QuizScreen extends StatefulWidget{const QuizScreen({super.key});@override State<QuizScreen> createState()=>_S();}
class _S extends State<QuizScreen>{String level='N5';List<Kotoba> all=[];Kotoba? cur;List<String> choices=[];String? selected;int score=0,total=0;final r=Random();
 @override void initState(){super.initState();_load();} Future<void> _load()async{all=await DataService.kotoba();_next();}
 void _next(){final p=all.where((x)=>x.level==level).toList();if(p.isEmpty)return;cur=p[r.nextInt(p.length)];final w=(List<Kotoba>.from(p)..shuffle(r)).where((x)=>x.id!=cur!.id).take(3).map((x)=>x.meaning).toList();choices=[cur!.meaning,...w]..shuffle(r);setState(()=>selected=null);}
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Quiz Kotoba')),body:all.isEmpty?const Center(child:CircularProgressIndicator()):ListView(padding:const EdgeInsets.all(16),children:[
  LevelChips(selected:level,onChanged:(v){if(v!='ALL'){level=v;_next();}}),const SizedBox(height:20),Text('Skor: $score / $total',style:const TextStyle(fontWeight:FontWeight.bold)),
  const SizedBox(height:12),Card(child:Padding(padding:const EdgeInsets.all(24),child:Column(children:[Text(cur!.kanji,style:const TextStyle(fontSize:48,fontWeight:FontWeight.bold)),Text(cur!.kana,style:const TextStyle(fontSize:22)),const SizedBox(height:8),const Text('Apa artinya?')] ))),
  ...choices.map((x)=>Padding(padding:const EdgeInsets.symmetric(vertical:5),child:OutlinedButton(
   onPressed:selected!=null?null:(){setState((){selected=x;total++;if(x==cur!.meaning){score++;ProgressService.addQuizCorrect();}});},child:Align(alignment:Alignment.centerLeft,child:Text(x))))),
  if(selected!=null)Column(children:[const SizedBox(height:8),Text(selected==cur!.meaning?'🎉 Benar!':'❌ Belum tepat. Jawaban: ${cur!.meaning}',style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold)),const SizedBox(height:10),FilledButton(onPressed:_next,child:const Text('Soal berikutnya'))])
 ]));
}
