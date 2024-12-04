package cybercriminals;
import criminals.Criminal;

  // Class representing a Hactivist in the cybercriminal world, extending CyberCriminal
  public class Hactivist extends CyberCriminal {
     // Constructor to initialize a Hactivist object with name and age
     public Hactivist(String name, int age) {
        super(name, age);

     }


     // Overriding the commitCyberCrime method to print a message about the cybercrime being committed
     @Override

// This method is named commitCyberCrime
     public void commitCyberCrime(String command) {
        System.out.println(getName() + " Is hacking for a political cause." + command);
     }
  }
