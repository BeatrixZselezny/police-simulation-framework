package cybercriminals;


  // Class representing a Script Kiddie in the cybercriminal world, extending CyberCriminal
  public class ScriptKiddie extends CyberCriminal {
     // Constructor to initialize a Script Kiddie object with name and age
     public ScriptKiddie(String name, int age) {
        super(name, age);

     }


     // Overriding the commitCyberCrime method to print a message about the cybercrime being committed
     @Override

// This method is named commitCyberCrime
     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is using pre written scripts to hack." + command);

     }
  }
