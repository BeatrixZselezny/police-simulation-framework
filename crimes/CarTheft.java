
  package crimes;


  public class CarTheft extends AbstractCrime {
     public CarTheft() {
        super("Car Theft");
     }


     @Override

     public void commitCrime() {
        System.out.println("Committing car theft...");
     }

  }
