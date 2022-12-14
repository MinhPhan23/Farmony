public class Convo
{
  private final String YOU = "you";
  //each Node contain the character name and what they say in that turn
  private class Node
  {
    boolean chooseFlag; //true if this node has option to choose
    String[] option; //if it is player choice, store all options in an array
    Node[] optionNext = new Node[3]; //the path of each option
    
    String dialog;
    String name; //name of character
    Node next;

    //Contructor when player have options
    Node(String[] option)
    {
      this.option = new String[option.length-1];
      for (int i = 0; i < option.length-1; i++) {
        this.option[i] = option[i+1];
      }
      chooseFlag = true;
      name = YOU;
      next = null;
    }

    //contruction for normal conversation flow
    Node(String dialog, String name)
    {
      this.dialog = dialog;
      chooseFlag = false;
      this.name = name;
      next = null;
    }
  }

  //the flow of conversation
  private class Flow
  {
    Node top;
    Node last;

    Flow()
    {
      top = null;
      last = null;
    }
  }

  Flow flow = new Flow();

  Flow option1 = new Flow();
  Flow option2 = new Flow();
  Flow option3 = new Flow();
  boolean startOption = false;

  private void parse(String[] parse)
  {
    //first character having 'O' indicate option node
    if (parse[0].charAt(0) == 'O')
    {
      Node newNode = new Node(parse);
      if (flow.top == null)
      {
        flow.top = newNode;
      } else
        flow.last.next = newNode;
      flow.last = newNode;
      startOption = true;
    } 
    //if second character contains a number indicate path of each option
    else if (parse[1].charAt(0) != 'M')
    {
      Node newNode = new Node(parse[3], parse[2]);
      if (parse[1].charAt(0) == '1')
      {
        if (option1.top == null)
        {
          option1.top = newNode;
          flow.last.optionNext[0] = option1.top;
        } else
          option1.last.next = newNode;
        option1.last = newNode;
      } else if (parse[1].charAt(0) == '2')
      {
        if (option2.top == null)
        {
          option2.top = newNode;
          flow.last.optionNext[1] = option2.top;
        } else
          option2.last.next = newNode;
        option2.last = newNode;
      } else
      {
        if (option3.top == null)
        {
          option3.top = newNode;
          flow.last.optionNext[2] = option3.top;
        } else
          option3.last.next = newNode;
        option3.last = newNode;
      }
    } 
    //when the path merge into the main flow
    else if (startOption)
    {
      Node newNode = new Node(parse[3], parse[2]);
      if (option3.top != null)
      {
        option3.last.next = newNode;
        flow.last.optionNext[2] = option3.top;
      }
      option1.last.next = newNode;
      option2.last.next = newNode;

      //connect the head of each path to the main flow
      flow.last.optionNext[0] = option1.top;
      flow.last.optionNext[1] = option2.top;

      option1 = new Flow();
      option2 = new Flow();
      option3 = new Flow();
      startOption = false;

      flow.last = newNode;
    } else
    {
      //add normal sentences to the flow
      Node newNode = new Node(parse[3], parse[2]);
      if (flow.top == null)
      {
        flow.top = newNode;
      } else
        flow.last.next = newNode;
      flow.last = newNode;
    }
  }
  
  Node curr;
  //get the sentence of the current turn
  public String getCurrDialog(int option)
  {
    String result;
    if (option == 0)
    {
      result = curr.dialog;
    } 
    else
      result = curr.option[option];
    return result;
  }
  //get name of the speaking person
  public String getCurrName()
  {
    return curr.name;
  }
  //the flow still goes on
  public boolean hasNext()
  {
    return curr.next != null;
  }
  //get the next turn
  public void next(int option)
  {
    if (option == 0)
    {
      curr = curr.next;
    }
    else
    {
      curr = curr.optionNext[option-1];
    }
  }
  //set pointer to start of conversation
  public void setCurr()
  {
    curr = flow.top;
  }
  //player can choose in this turn
  public boolean isOption()
  {
    return curr.chooseFlag;
  }
  //get all possible options
  public String[] getOption()
  {
    return curr.option;
  }
}
