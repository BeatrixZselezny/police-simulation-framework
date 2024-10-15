
  package crimes;


  public class Hacking extends AbstractCrime {
     public Hacking() {
        super("Hacking");
     }


     @Override

     public void commitCrime() {
        System.out.println("Committing hacking...");
     }

     @Override

     public void getCaught() {
        System.out.println(" Caughted");
     }
  }
