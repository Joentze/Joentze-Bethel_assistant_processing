
 String[] new_removed(String[] array, String keyWord){
   
 String[] retArray = {};
 
 for(String word:array){
 if(!word.equals(keyWord)){
 retArray = append(retArray,word);
 }
 }
 return retArray;
 }
 
 //PARSES THROUGH XML DATA RECEIVED
 String[] XMLreturn(XML pageListed){
 
  //QUERY PAGE FOR WIKIPEDIA
  XML introduction = pageListed.getChild("query");
  String currLn = introduction.getContent();
  String[] sepQuery = split(currLn,". "); 
  return sepQuery;
}
//GOOGLE--->"+"
//WIKIPEDIA--->"%20"
String returnString(String input,String symbol){
  //cleans up the input strig into a generalised format
  String retArray;
  String[] seperation = split(input,' ');
  retArray = join(seperation,symbol);
  return retArray;
}
/*
String returnString_G(String input){
  //cleans up the input strig into a generalised format
  String retArray;
  String[] seperation = split(input,' ');
  retArray = join(seperation,"+");
  return retArray;
}*/

String jointString(String input){
 String[] splitString = split(input,' '); 
  String jointReturn = join(splitString,"");
  return jointReturn;
}
