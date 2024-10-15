
  package crimes;


  public class Robbery extends AbstractCrime {
     public Robbery() {
        super("Robbery");
     }


     @Override

     public void commitCrime() {
        System.out.println("Committing robbery...");
     }

     @Override

     public void getCaught() {
        System.out.println(" Caughte:wq!");

     }
  }
