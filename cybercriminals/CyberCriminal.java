package cybercriminals;
import criminals.Criminal;

  // Abstract class representing a CyberCriminal, extending Criminal
  public abstract class CyberCriminal extends Criminal {
     // Constructor to initialize a CyberCriminal object with name and age
     public CyberCriminal(String name, int age) {
        super(name, age);
     }

     // Abstract method to commit a cyber crime with a specified command
     public abstract void commitCyberCrime(String command);


  }
