
//LOADS HASH MAPS, MAKES HASH MAP STRING INDEXED FOR SWITCH STATEMENT
void loadHashmap(String directory, String fileName){
  String[] fileLines = loadStrings(directory+'/'+fileName);
  for(String currLn:fileLines){
   String[] sepLine = split(currLn,':');
   String name = sepLine[0];
   String combiNo = sepLine[1];
   String[] combiSplt = split(combiNo,'/');
   printArray(sepLine);
   println("  ");
   int number = int(join(combiSplt,""));
   combiHashList.put(name,number);
  }
}
