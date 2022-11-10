public class Convo
{
  private class Node
  {
    String[] option;
    String dialog;
    String name;
    boolean chooseFlag;
    Node next;
    Node[] optionNext = new Node[3];

    Node(String[] option)
    {
      this.option = new String[option.length-1];
      for (int i = 0; i < option.length-1; i++) {
        this.option[i] = option[i+1];
      }
      chooseFlag = true;
      name = "You";
      next = null;
    }

    Node(String dialog, String name)
    {
      this.dialog = dialog;
      chooseFlag = false;
      this.name = name;
      next = null;
    }
  }

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
    if (parse[0].charAt(0) == 'O')
    {
      Node newNode = new Node(parse);
      flow.last.next = newNode;
      flow.last = newNode;
      startOption = true;
    } else if (parse[1].charAt(0) != 'M')
    {
      Node newNode = new Node(parse[3], parse[2]);
      if (parse[1].charAt(0) == '1')
      {
        if (option1.top == null)
        {
          option1.top = newNode;
        } else
          option1.last.next = newNode;
        option1.last = newNode;
        flow.last.optionNext[0] = option1.top;
      } else if (parse[1].charAt(0) == '2')
      {
        if (option2.top == null)
        {
          option2.top = newNode;
        } else
          option2.last.next = newNode;
        option2.last = newNode;
        flow.last.optionNext[1] = option2.top;
      } else
      {
        if (option3.top == null)
        {
          option3.top = newNode;
        } else
          option3.last.next = newNode;
        option3.last = newNode;
        flow.last.optionNext[2] = option3.top;
      }
    } else if (startOption)
    {
      Node newNode = new Node(parse[3], parse[2]);
      if (option3.top != null)
      {
        option3.last.next = newNode;
        flow.last.optionNext[2] = option3.top;
      }
      option1.last.next = newNode;
      option2.last.next = newNode;
      flow.last.optionNext[0] = option1.top;
      flow.last.optionNext[1] = option2.top;
      option1 = new Flow();
      option2 = new Flow();
      option3 = new Flow();
      startOption = false;

      flow.last = newNode;
    } else
    {
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
  
  public String getCurrName()
  {
    return curr.name;
  }
  
  public boolean hasNext()
  {
    return curr.next != null;
  }
  
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
  
  public void setCurr()
  {
    curr = flow.top;
  }
  
  public boolean isOption()
  {
    return curr.chooseFlag;
  }
  
  public String[] getOption()
  {
    return curr.option;
  }
}
