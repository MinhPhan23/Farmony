public void parseScript(String scriptPath, Convo convo)
{
  String[] script = loadStrings(scriptPath);
  String[] parsedLine = new String[4];
  String path = "M";
  for (int i = 0; i < script.length; i++)
  {
    if (script[i].charAt(0) == '1' || script[i].charAt(0) == '2' || script[i].charAt(0) == '3')
      path = script[i].charAt(0) + "";
    else if (script[i].charAt(0) != '%')
    {
      parsedLine = parseLine(i, path, script);
      if (script[i].charAt(0) == '$')
      {
        if (parsedLine[3].equals(""))
          i += 2;
        else
          i += 3;
      }
      // \/ if you want to print the output to look at it
      // System.out.println(parsedLine[0] + " - " + parsedLine[1] + " - " + parsedLine[2] + " - " + parsedLine[3]);
      // parse convo here
      convo.parse(parsedLine);
    } else
    {
      path = "M";
    }
  }
}

private String[] parseLine(int line, String curPath, String[] script)
{
  String[] toReturn = new String[4];
  if (script[line].charAt(0) == '$')
  {
    toReturn[0] = "O";
    int i = 1;
    while (script[line + i].charAt(0) != '%')
    {
      toReturn[i] = script[line + i].substring(2);
      i++;
    }
    if (toReturn[3] == null)
    toReturn[3] = "";
  } else
  {
    toReturn[0] = " ";
    toReturn[1] = curPath;
    toReturn[2] = "No-Beard";
    if (script[line].charAt(0) == 'P')
      toReturn[2] = "You";
    else if (script[line].charAt(0) == 'C')
      toReturn[2] = "The Gunslinger";
    else if (script[line].charAt(0) == 'L')
      toReturn[2] = "The Woodsman";
    else if (script[line].charAt(0) == 'D')
      toReturn[2] = "Dad";
    else if (script[line].charAt(0) == 'M')
      toReturn[2] = "Mom";
    toReturn[3] = script[line].substring(2);
  }
  return toReturn;
}
