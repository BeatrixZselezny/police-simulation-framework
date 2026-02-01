
  package crimes;

  // Class representing the crime of hacking, extending AbstractCrime
  public class Hacking extends AbstractCrime {
     // Constructor to initialize a Hacking object with the type "Hacking"
     public Hacking() {
        super("Hacking");
     }

     // Method to commit the hacking crime
     @Override

// This method is named commitCrime
     public void commitCrime() {
        System.out.println("Committing hacking...");
     }

     // Method to handle the scenario when the hacking is caught
     @Override

// This method is named getCaught
     public void getCaught() {
        System.out.println(" Caughted");
     }
  }
