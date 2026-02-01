
  package crimes;

  // Class representing the crime of robbery, extending AbstractCrime
  public class Robbery extends AbstractCrime {
     // Constructor to initialize a Robbery object with the type "Robbery"
     public Robbery() {
        super("Robbery");
     }


     // Method to commit the robbery crime
     @Override

// This method is named commitCrime
     public void commitCrime() {
        System.out.println("Committing robbery...");
     }

     // Method to handle the scenario when the robbery is caught
     @Override

// This method is named getCaught
     public void getCaught() {
        System.out.println(" Caught!");

     }
  }
