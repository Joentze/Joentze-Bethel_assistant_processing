void execute(){
  
 switch(combiHashList.get(NOH)){
 //SEARCH_01
 case 172 :
 println("conducting gerneral search...");
 srch.wikiSearch(inputString);
break;
//SEARCH_02
 case 72:
 println("conducting gerneral search...");
 srch.wikiSearch(inputString);
 break;
 //SEARCH_03
  case 100:
 
 break;
 //SEARCH_04
  case 104:
 
 break;
 //WA_SEARCH_01
  case 17284:
 srch.wolframAlpha(inputString);
 break;
 //WA_SEARCH_02
  case 172684:
  srch.wolframAlpha(inputString);
 break;
 //WA_SEARCH_03
  case 7284:
  srch.wolframAlpha(inputString);
 break;
 //WA_SEARCH_04
  case 72684:
  srch.wolframAlpha(inputString);
 break;
 //WA_SEARCH_05
  case 784:
  srch.wolframAlpha(inputString);
 break;
 //WA_SEARCH_06
  case 80:
  srch.wolframAlpha(inputString);
 break;
 //NEWS_01
  case 7264:
 newsS.getNews(inputString);
 testPrintNews(news);
 break;
 //NEWS_02
  case 90:
  newsS.getNews(inputString);
  testPrintNews(news);
 break;
 //NEWS_03
  case 17264:
  newsS.getNews(inputString);
  testPrintNews(news);
 break;
 //NEWS_04
  case 95:
  newsS.getNews(inputString);
  testPrintNews(news);
 break;
 //RETURN_QUERY_01
 case 0 :
 
 break;
 default:
 
 
 break;
 }
}
