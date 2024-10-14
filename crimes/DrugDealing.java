
  package crimes;


  public class DrugDealing extends AbstractCrime {
     public DrugDealing() {
        super("Drug Dealing");
     }


     @Override

     public void commitCrime() {
        System.out.println("Committing drug dealing...");
     }
  }
