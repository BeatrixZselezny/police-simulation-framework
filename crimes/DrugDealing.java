
  package crimes;

  // Class representing the crime of drug dealing, extending AbstractCrime
  public class DrugDealing extends AbstractCrime {
     // Constructor to initialize a DrugDealing object with the type "Drug Dealing"
     public DrugDealing() {
        super("Drug Dealing");
     }


     // Method to commit the drug dealing crime
     @Override

     public void commitCrime() {
        System.out.println(getType() + " committed!");
	setCaught(true);
     }

     // Method to handle the scenario when the drug dealing is caught
     @Override

     public void getCaught() {
        System.out.println(getType() + " caught!");
	setCaught(true);

     }
  }
