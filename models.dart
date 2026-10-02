
class Kotoba {
 final String id,level,kanji,kana,romaji,meaning,example,exampleMeaning;
 Kotoba({required this.id,required this.level,required this.kanji,required this.kana,required this.romaji,required this.meaning,required this.example,required this.exampleMeaning});
 factory Kotoba.fromJson(Map<String,dynamic> j)=>Kotoba(id:j['id'],level:j['level'],kanji:j['kanji'],kana:j['kana'],romaji:j['romaji'],meaning:j['meaning'],example:j['example'],exampleMeaning:j['exampleMeaning']);
}
class Bunpo {
 final String id,level,pattern,formula,meaning,example,exampleMeaning;
 Bunpo({required this.id,required this.level,required this.pattern,required this.formula,required this.meaning,required this.example,required this.exampleMeaning});
 factory Bunpo.fromJson(Map<String,dynamic> j)=>Bunpo(id:j['id'],level:j['level'],pattern:j['pattern'],formula:j['formula'],meaning:j['meaning'],example:j['example'],exampleMeaning:j['exampleMeaning']);
}
