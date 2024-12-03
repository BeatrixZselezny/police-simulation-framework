package cybercriminals;

  // Class representing a State Actor in the cybercriminal world, extending CyberCriminal
  public class StateActor extends CyberCriminal {
     // Constructor to initialize a State Actor object with name and age
     public StateActor(String name, int age) {
        super(name, age);

     }


     // Overriding the commitCyberCrime method to print a message about the cybercrime being committed
     @Override

     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is hacking on behalf of a goverment" + command);
    }
  }
