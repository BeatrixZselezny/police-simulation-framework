
  package crimes;


  public class Hacking extends AbstractCrime {
     public Hacking() {
        super("Hacking");
     }


     @Override

     public void commitCrime() {
        System.out.println("Committing hacking...");
     }
  }
