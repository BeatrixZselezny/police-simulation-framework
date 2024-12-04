package cybercriminals;

  // Class representing an Insider Threat in the cybercriminal world, extending CyberCriminal
  public class InsiderThreat extends CyberCriminal {
     // Constructor to initialize an InsiderThreat object with name and age
     public InsiderThreat(String name, int age) {
        super(name, age);
     }


     // Overriding the commitCyberCrime method to print a message about the cybercrime being committed
     @Override

// This method is named commitCyberCrime
     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is using insider information to commit cyber crimes." + command);

     }
  }
