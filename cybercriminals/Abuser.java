package cybercriminals;

  // Class representing an Abuser in the cybercriminal world, extending CyberCriminal
  public class Abuser extends CyberCriminal {
     // Constructor to initialize an Abuser object with name and age
     public Abuser(String name, int age) {
        super(name, age);
     }


    // Overriding the commitCyberCrime method to print a message about the cybercrime being committed
    @Override

    public void commitCyberCrime(String command) {
       System.out.println(getName() + " is harming others due to severe mental issues." + command);

    }
  }
