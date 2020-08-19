  String GnewsAPIkey ="a35fef88d2a3d50d06038787a88db636";


class newsSearch {
  
  void getNews(String input){
   
    if(isPhrasePres(input,loadCurrentFiles(directory_03_keyPhrases,phrasesList[1])) == false && isPhrasePres(input,loadCurrentFiles(directory_03_keyPhrases,phrasesList[2])) == false){
    
    //String[] nounsToBeSearched = newsNounSearched(input,concatAllPhrases(directory_03_keyPhrases,phrasesList[0]));
  
    
  try{
    try{
      
      String[] removed_words = NounsToBeSearched(input, directory_01_wordBanks, listWordBanks);
      String[] removed_phrase = newsNounSearched(join(removed_words,' '),concatAllPhrases(directory_03_keyPhrases,phrasesList[0]));
      String toSearch = returnString(join(removed_phrase,' '),"+");
      println(toSearch);
      GetRequest GNewsGet = new GetRequest("https://gnews.io/api/v3/search?q="+toSearch+"&token="+GnewsAPIkey);  
      GNewsGet.send();
      news = JSONparse(GNewsGet.getContent(),objectsInArticle);
    
  }
    catch(RuntimeException e){
     println("invalid search"); 
    }
   }
   catch(RuntimeException e){
     
     println("is the internet is down?");
     
     
   }
    
  }
  else if(isPhrasePres(input,loadCurrentFiles(directory_03_keyPhrases,phrasesList[2])) == true){
   srch.wolframAlpha(input); 
  }
}

  
}



//PARSES THROUGH THE RECEIVING JSON FILE AND RETURNS 2D ARRAY CONTAINING  
String[] objectsInArticle = {"title","description","url","image"};
String[][] JSONparse(String getContent,String[] objectsInArticle){
  
  JSONObject jsonGNews = parseJSONObject(getContent);
  
  JSONArray G_returnNews = jsonGNews.getJSONArray("articles");
 
  int arraySize = G_returnNews.size();
  int containerSize = objectsInArticle.length;
  
  String[][] return_2D = new String[containerSize][arraySize];

for(int cnt = 0; cnt<arraySize ; cnt++){
  //GETS THE BODY FOR THE FIRST..SECOND...HEADLINE
for(int i = 0; i<  containerSize ; i++){
  JSONObject G_body = G_returnNews.getJSONObject(cnt);
  //GETS BODY TITLE
  try{String G_titleTop = G_body.getString(objectsInArticle[i]);
  return_2D[i][cnt] = G_titleTop;
    }
  catch(RuntimeException e){
   return_2D[i][cnt] = "no_"+objectsInArticle[i]; 
  }}

}

return return_2D;

}

//**INSERT CONCATPHRASES**
String[] newsNounSearched(String input, String[] allPhrases){
  String[] eachWord = split(input,' ');
  String[] holder = eachWord;
  
for(String currWord:allPhrases){
 
  holder = new_removed(holder,currWord);  
 
}
return holder;
}
