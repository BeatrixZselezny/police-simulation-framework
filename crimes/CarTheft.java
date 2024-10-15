
  package crimes;

  public class CarTheft extends AbstractCrime {
     public CarTheft() {
        super("Car Theft");
     }


     @Override
     public void getCaught() {
	System.out.println(getType() + " caught!");     
	setCaught(true);

       }

     @Override
     public void commitCrime() {
        System.out.println(getType() + " crime committed!");
        setCaught(true);

       }

     }



  
